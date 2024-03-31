using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class PositionsModel
    {
        public decimal? AccountBalance { get; set; }
        public static IEnumerable<PositionsModel> GetAcctBalanceByAcctNum(string acctNum)
        {
            var acctBalances = new List<PositionsModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctBalanceByAcctNum]";

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
                        var acctBalance = new PositionsModel
                        {
                            AccountBalance = reader["Acct Balance"] as decimal?
                        };
                        acctBalances.Add(acctBalance);
                    }
                }
            }
            return acctBalances;
        }
        
        public string PositionsStockTicker { get; set; }
        public decimal? PositionsQuantity { get; set; }
        public decimal? PositionsAverageCost { get; set; }
        public decimal? PositionsCurrentPrice { get; set; }
        public decimal? PositionsCurrentValue { get; set; }

        public static IEnumerable<PositionsModel> GetAcctHoldingsByAcctNum(string acctNum)
        {
            var acctHoldings = new List<PositionsModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctHoldingsByAcctNum]";

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
                        var acctHolding = new PositionsModel
                        {
                            PositionsStockTicker = reader["Symbol"] as string,
                            PositionsQuantity = reader["Quantity"] as decimal?,
                            PositionsAverageCost = reader["Dollar Cost Average"] as decimal?,
                            PositionsCurrentPrice = reader["Current Stock Price"] as decimal?,
                            PositionsCurrentValue = reader["Current Value"] as decimal?
                        };
                        acctHoldings.Add(acctHolding);
                    }
                }
            }
            return acctHoldings;
        }
    }
}