using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class AccessHistoryModel
    {
        public string HistoryAccountNumber { get; set; }
        public string HistoryRepID { get; set; }
        public DateTime? HistoryDate { get; set; }
        

        public static IEnumerable<AccessHistoryModel> GetClientAccessHistoryByAcctNum(string acctNum)
        {
            var accessHistorys = new List<AccessHistoryModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Client_GetClientAccessHistoryByAcctNum]";

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
                        var accessHistory = new AccessHistoryModel
                        {
                            HistoryAccountNumber = reader["Acct Number"] as string,
                            HistoryRepID = reader["Rep ID"] as string,
                            HistoryDate = reader["Date"] as DateTime?,
                        };
                        accessHistorys.Add(accessHistory);
                    }
                }
            }
            return accessHistorys;
        }
    }
}
