using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class AchLinkModel
    {
        public string LUAchBankName { get; set; }
        
        public string LUAchRoutingNumber { get; set; }

        public static IEnumerable<AchLinkModel> LookUpBankRouting()
        {
            var achBankLists = new List<AchLinkModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[MainClient_LookUpBankRouting]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var achBankList = new AchLinkModel
                        {
                            LUAchBankName = reader[0] as string,
                            LUAchRoutingNumber = reader[1] as string
                        };
                        achBankLists.Add(achBankList);
                    }
                }
            }
            return achBankLists;
        }

        public string AchBankType { get; set; }

        public static IEnumerable<AchLinkModel> LookUpBankAcctType()
        {
            var achBankTypeLists = new List<AchLinkModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[MainClient_LookUpBankAcctType]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var achBankTypeList = new AchLinkModel
                        {
                            AchBankType = reader[0] as string
                        };
                        achBankTypeLists.Add(achBankTypeList);
                    }
                }
            }
            return achBankTypeLists;
        }

        public string AchNickname { get; set; }
        public string AchBankName { get; set; }
        public string AchRoutingNumber { get; set; }
        public string AchAccountNumber { get; set; }
        public string AchAccountType { get; set; }
        public DateTime? AchAddedDate { get; set; }
        public DateTime? AchRemovedDate { get; set; }
        public string AchRepID { get; set; }

        public static IEnumerable<AchLinkModel> GetAcctAchLinksByAcctNum(string acctNum)
        {
            var accountAchs = new List<AchLinkModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctAchLinksByAcctNum]";

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
                        var accountAch = new AchLinkModel
                        {
                            AchNickname = reader["Nickname"] as string,
                            AchBankName = reader["Bank Name"] as string,
                            AchRoutingNumber = reader["Routing Num"] as string,
                            AchAccountNumber = reader["Acct Num"] as string,
                            AchAccountType = reader["Acct Type"] as string,
                            AchAddedDate = reader["Added On"] as DateTime?,
                            AchRemovedDate = reader["Removed On"] as DateTime?,
                            AchRepID = reader["Rep ID"] as string
                        };
                        accountAchs.Add(accountAch);
                    }
                }
            }
            return accountAchs;
        }

        public static void InsertAcctAchSetupByAcctNum(string acctNum, string newAchRoutingNum, string newAchAccountNum, string newAchAccountType, string newAchNickname, string repId)
        {
            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_InsertAcctAchSetupByAcctNum]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                
                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));
                command.Parameters.Add(new SqlParameter("@AchRoutingNum", newAchRoutingNum));
                command.Parameters.Add(new SqlParameter("@AchAcctNum", newAchAccountNum));
                command.Parameters.Add(new SqlParameter("@AchAcctType", newAchAccountType));
                command.Parameters.Add(new SqlParameter("@Nickname", newAchNickname));
                command.Parameters.Add(new SqlParameter("@RepId", repId));

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public DateTime? TransactionDate { get; set; }
        public decimal? TransactionAmt { get; set; }
        public string TransactionBankName { get; set; }
        public string TransactionRoutingNumber { get; set; }
        public string TransactionAccountNumber { get; set; }
        public string TransactionRepID { get; set; }

        public static IEnumerable<AchLinkModel> GetAcctTransactionsAchByAcctNum(string acctNum)
        {
            var accountAchTransactions = new List<AchLinkModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctTransactionsAchByAcctNum]";

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
                        var accountAchTransaction = new AchLinkModel
                        {
                            TransactionDate = reader["Transaction Date"] as DateTime?,
                            TransactionAmt = reader["Transaction Amount"] as decimal?,    
                            TransactionBankName = reader["Bank Name"] as string,
                            TransactionRoutingNumber = reader["Bank Routing"] as string,
                            TransactionAccountNumber = reader["Acct Num"] as string,
                            TransactionRepID = reader["Rep ID"] as string
                        };
                        accountAchTransactions.Add(accountAchTransaction);
                    }
                }
            }
            return accountAchTransactions;
        }

        public string PaymentNickname { get; set; }
        public string PaymentBankName { get; set; }
        public string PaymentRouting { get; set; }
        public string PaymentAcctNum { get; set; }
        public string DisplayName => $"{PaymentNickname} - {PaymentAcctNum}";

        public static IEnumerable<AchLinkModel> GetAcctAchListByAcctNum(string acctNum)
        {
            var achPaymentLists = new List<AchLinkModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctAchListByAcctNum]";

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
                        var achPaymentList = new AchLinkModel
                        {
                            PaymentNickname = reader["Nickname"] as string,
                            PaymentBankName = reader["Bank Name"] as string,
                            PaymentRouting = reader["Bank Routing"] as string,
                            PaymentAcctNum = reader["Bank Acct Num"] as string,
                        };
                        achPaymentLists.Add(achPaymentList);
                    }
                }
            }
            return achPaymentLists;
        }

        public static void InsertAcctTransactionAchByAcctNum(string acctNum, string bankRoutingNum, string bankAccountNum, decimal? transAmt, string repId)
        {
            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_InsertAcctTransactionAchByAcctNum]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                
                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));
                command.Parameters.Add(new SqlParameter("@BankRoutingNum", bankRoutingNum));
                command.Parameters.Add(new SqlParameter("@BankAcctNum", bankAccountNum));
                command.Parameters.Add(new SqlParameter("@TransAmt", transAmt));
                command.Parameters.Add(new SqlParameter("@RepId", repId));

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}