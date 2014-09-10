using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Main : ProFazekPageBase
{
    string directoryName = "LuceneArticleDB";
    string luceneDBPath = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string appDataPath = Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, "App_Data");
        luceneDBPath = Path.Combine(appDataPath, directoryName);

        if (!IsPostBack)
        {
            DateTime startDate = new DateTime(2008, 1, 1, 0, 0, 0);
            FromTextBox.Text = startDate.ToShortDateString();
            FromTextBox_CalendarExtender.SelectedDate = startDate;
            DateTime now = DateTime.Now;
            ToTextBox.Text = now.ToShortDateString();
            ToTextBox_CalendarExtender.SelectedDate = now;

            ArticleService a = new ArticleService();
            DataList1.DataSource = a.GetArticles();
            DataList1.DataBind();
        }
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(SearchTextBox.Text))
        {
            Lucene.Net.Store.RAMDirectory ramDir = new Lucene.Net.Store.RAMDirectory(luceneDBPath);

            String srch = SearchTextBox.Text;
            Lucene.Net.Search.IndexSearcher idx = new Lucene.Net.Search.IndexSearcher(ramDir);
            Lucene.Net.QueryParsers.QueryParser qp = new Lucene.Net.QueryParsers.QueryParser("_searchtxt", new Lucene.Net.Analysis.Standard.StandardAnalyzer());
            qp.SetDefaultOperator(Lucene.Net.QueryParsers.QueryParser.Operator.AND);
            Lucene.Net.Search.BooleanQuery.SetMaxClauseCount(100);

            Lucene.Net.Search.Hits hits = idx.Search(qp.Parse(srch));

            List<int> aIds = new List<int>();
            for (int i = 0; i < hits.Length(); i++)
            {
                Lucene.Net.Documents.Document doc = hits.Doc(i);
                int aid = 0;
                if (int.TryParse(doc.Get("id"), out aid))
                {
                    aIds.Add(aid);
                }
            }

            using (DataClassesDataContext dtx = new DataClassesDataContext())
            {
                var arts = from a in dtx.Articles
                           where aIds.Contains(a.Id)
                           select a;

                DataList1.DataSource = arts;
                DataList1.DataBind();
            }

            idx.Close();

            GC.Collect();
        }
    }

    protected void IndexButton_Click(object sender, EventArgs e)
    {
        Directory.CreateDirectory(luceneDBPath);

        Lucene.Net.Store.FSDirectory dir = Lucene.Net.Store.FSDirectory.GetDirectory(luceneDBPath, true);
        Lucene.Net.Index.IndexWriter idx = new Lucene.Net.Index.IndexWriter(dir, new Lucene.Net.Analysis.Standard.StandardAnalyzer(), true);

        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            int FailCount = 0;
            foreach (var a in dtx.Articles)
            {
                String searchText = String.Join(" ", new String[] { a.Title, a.Subtitle, a.Lead, a.Body,
                                            a.Created.ToLongDateString(), a.Created.ToLongTimeString(),
                                            a.Created.ToShortDateString(), a.Created.ToShortTimeString()});

                Lucene.Net.Documents.Document doc = new Lucene.Net.Documents.Document();
                doc.Add(new Lucene.Net.Documents.Field("id", a.Id.ToString(), Lucene.Net.Documents.Field.Store.YES, Lucene.Net.Documents.Field.Index.UN_TOKENIZED));
                doc.Add(new Lucene.Net.Documents.Field("_searchtxt", searchText, Lucene.Net.Documents.Field.Store.NO, Lucene.Net.Documents.Field.Index.TOKENIZED));

                try
                {
                    idx.AddDocument(doc);
                }
                catch
                {
                    FailCount++;
                }
            }
        }

        idx.Optimize();
        idx.Close();
        dir.Close();
        GC.Collect();
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        // TODO (if the website will have edit interface we should update the search DB too)
    }

    protected void FilterButton_Click(object sender, EventArgs e)
    {
        DateTime fromDate;
        bool isValidFromDate = DateTime.TryParse(FromTextBox.Text, out fromDate);
        DateTime toDate;
        bool isValidToDate = DateTime.TryParse(ToTextBox.Text, out toDate);

        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var arts = from a in dtx.Articles
                       where ((!isValidFromDate || a.Created >= fromDate) &&
                              (!isValidToDate || a.Created <= toDate))
                       orderby a.Created descending
                       select a;

            DataList1.DataSource = arts;
            DataList1.DataBind();
        }
    }
}
