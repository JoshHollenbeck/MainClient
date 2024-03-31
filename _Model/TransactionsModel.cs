using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class TransactionsModel
    {
        public DateTime? TransactionsDate { get; set; }
        public string TransactionsAction { get; set; }
        public string TransactionsTradeSymbol { get; set; }
        public decimal? TransactionsTradeQuantity { get; set; }
        public decimal? TransactionsAmount { get; set; }
        public decimal? TransactionsTradeFees { get; set; }
        public decimal? TransactionsTradePrice { get; set; }
        public string TransactionsTradeStatus { get; set; }
        public decimal? TransactionsPreBalance { get; set; }
        public decimal? TransactionsPostBalance { get; set; }
        public string TransactionsRepID { get; set; }
        public string TransactionBankRouting { get; set; }
        public string TransactionBankAcct { get; set; }

        public static IEnumerable<TransactionsModel> GetAcctTransactionsByAcctNum(string acctNum)
        {
            var acctTransactions = new List<TransactionsModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctTransactionsByAcctNum]";

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
                        var acctTransaction = new TransactionsModel
                        {
                            TransactionsDate = reader["Transaction Date"] as DateTime?,
                            TransactionsAction = reader["Action"] as string,
                            TransactionsAmount = reader["Amount"] as decimal?,
                            TransactionsTradeSymbol = reader["Symbol"] as string,
                            TransactionsTradeQuantity = reader["Trade Quantity"] as decimal?,
                            TransactionsTradePrice = reader["Trade Price"] as decimal?,
                            TransactionsTradeStatus = reader["Trade Status"] as string,
                            TransactionsTradeFees = reader["Trade/Wire Fees"] as decimal?,
                            TransactionBankRouting = reader["ACH/Wire Routing Num"] as string,
                            TransactionBankAcct = reader["ACH/Wire Acct Num"] as string,
                            TransactionsPreBalance = reader["Pre Balance"] as decimal?,
                            TransactionsPostBalance = reader["Post Balance"] as decimal?,
                            TransactionsRepID = reader["Rep ID"] as string,
                        };
                        acctTransactions.Add(acctTransaction);
                    }
                }
            }
            return acctTransactions;
        }
    }
}