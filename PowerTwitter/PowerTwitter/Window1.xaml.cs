using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Management.Automation;
using System.Collections;
using System.Management.Automation.Runspaces;
using System.IO;


namespace PowerTwitter
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();

            BindContext();
        }

        private void BindContext()
        {
            this.DataContext = GetTweets();
        }

        private IEnumerable GetTweets()
        {
            return ExecuteScript(@".\get-tweets.help.ps1 friends_timeline");
        }

        private IEnumerable ExecuteScript(string script)
        {
            MessageBox.Show(script);

            //Set current directory (to easily load scripts)
            System.Environment.CurrentDirectory =
                @"C:\Users\Brian Hartsock\Documents\Visual Studio 2008\Projects\PowersehllIntroTalk\";

            //Create runspace and open it
            //?

            //Create pipline
            //?

            return Enumerable.Range(0, 0);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var status = StatusText.Text;
            PromptToExecute(@".\update-status.help.ps1 '" + status.Replace("'", "''") + "'");        
        }

        private void PromptToExecute(string script)
        {
            var win = new ExecuteConfirmation();
            win.Show();
            win.Command_text.Text = script;
            win.Cancel_btn.Click += (obj, e2) =>
            {
                win.Close();
                Focus();
            };

            win.Execute_btn.Click += (obj, e2) =>
            {
                ExecuteScript(script);
                StatusText.Text = string.Empty;
                BindContext();
                win.Close();
                Focus();
            };
        }

        #region Uhoh I got stuck
        private IEnumerable ExecuteScript_help(string script)
        {
            //Set current directory (to easily load scripts)
            System.Environment.CurrentDirectory =
                @"C:\Users\Brian Hartsock\Documents\Visual Studio 2008\Projects\PowersehllIntroTalk\";

            //Create runspace and open it
            var runspace = RunspaceFactory.CreateRunspace();
            runspace.Open();

            //Create pipline
            using (var pipeline = runspace.CreatePipeline())
            {
                pipeline.Commands.AddScript(script);
                var results = pipeline.Invoke();
                return results
                    .Select(r => r.BaseObject);
            }
        }
        #endregion
    }
}
