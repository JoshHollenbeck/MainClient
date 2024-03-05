using System;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class MainWindowModel
    {
        public string NewWord { get; set; }

        public static MainWindowModel GetRandomWord()
        {
            MainWindowModel randomWord = null;
            
            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
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
                        randomWord = new MainWindowModel
                        {
                            NewWord = reader["word"] as string
                        };
                    }
                }
            }
            return randomWord;
        }
    }
}