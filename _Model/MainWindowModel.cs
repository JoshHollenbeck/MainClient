using System.Data.SqlClient;
using MainClient.Utilities;
using System.Collections.Generic;

namespace MainClient._Model
{
    public class MainWindowModel
    {
        public string NewWord { get; set; }

        public static MainWindowModel GetRandomWord()
        {
            MainWindowModel randomWord = null;

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[MainClient_GetRandomWord]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        randomWord = new MainWindowModel { NewWord = reader["word"] as string };
                    }
                }
            }
            return randomWord;
        }

        public string ClientFullName { get; set; }

        public static MainWindowModel GetClientNameByAcctNum(string acctNum)
        {
            MainWindowModel clientName = null;

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Client_GetClientNameByAcctNum]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        clientName = new MainWindowModel
                        {
                            ClientFullName = reader[0] as string
                        };
                    }
                }
            }
            return clientName;
        }

        public string ClientAcctAndName { get; set; }

        public static IEnumerable<MainWindowModel> GetClientAcctListByAcctNum(string acctNum)
        {
            var clientAccts = new List<MainWindowModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Client_GetClientAcctListByAcctNum]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var clientAcct = new MainWindowModel
                        {
                            ClientAcctAndName = reader[0] as string
                        };
                        clientAccts.Add(clientAcct);
                    }
                }
            }
            return clientAccts;
        }
    }
}
