using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class AccountOverviewModel
    {
        public string InitialContactMethod { get; set; }
        public string AccountType { get; set; }
        public string RegistrationName { get; set; }
        public string ClientFirstName { get; set; }
        public string ClientMiddleName { get; set; }
        public string ClientLastName { get; set; }
        public string ClientSuffix { get; set; }
        public string ClientAddress { get; set; }
        public string ClientAddress2 { get; set; }
        public string ClientCity { get; set; }
        public string ClientState { get; set; }
        public string ClientZip { get; set; }
        public string ClientCountry { get; set; }
        public string PrimaryContactName { get; set; }
        public string PrimaryContactAddress { get; set; }
        public string PrimaryContactAddress2 { get; set; }
        public string PrimaryContactCity { get; set; }
        public string PrimaryContactState { get; set; }
        public string PrimaryContactZip { get; set; }
        public string RepID { get; set; }
        public DateTime? EstablishedDate { get; set; }
        public bool? AccountStatus { get; set; }
        public string JurisdictionCountry { get; set; }
        public string JurisdictionState { get; set; }
        public string AccountPassword { get; set; }
        public string BranchLocation { get; set; }
        public string CustTaxId { get; set; }
        public int? AtmLimit { get; set; }
        public int? AchLimit { get; set; }
        public int? WireLimit { get; set; }
        public string EmailAddress { get; set; }
        public bool? WebBanking { get; set; }
        public bool? MobileBanking { get; set; }
        public bool? TwoFactor { get; set; }
        public bool? Biometrics { get; set; }
        public byte? AcctObjective { get; set; }
        public byte? AcctFunding { get; set; }
        public byte? AcctPurpose { get; set; }
        public byte? AcctActivity { get; set; }

        public static AccountOverviewModel GetAccountDetailsByAcctNum(string acctNum)
        {
            AccountOverviewModel accountOverview = null;

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctDetailsByAcctNum]";

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
                        accountOverview = new AccountOverviewModel
                        {
                            InitialContactMethod = reader["Initial Contact Method"] as string,
                            AccountType = reader["Acct Type"] as string,
                            RegistrationName = reader["Registration Name"] as string,
                            ClientFirstName = reader["First Name"] as string,
                            ClientMiddleName = reader.IsDBNull(reader.GetOrdinal("Middle Name"))
                                ? null
                                : reader["Middle Name"].ToString(),
                            ClientLastName = reader["Last Name"] as string,
                            ClientSuffix = reader.IsDBNull(reader.GetOrdinal("Suffix"))
                                ? null
                                : reader["Suffix"].ToString(),
                            ClientAddress = reader["Cust Address"] as string,
                            ClientAddress2 = reader.IsDBNull(
                                reader.GetOrdinal("Cust Address 2")
                            )
                                ? null
                                : reader["Cust Address 2"].ToString(),
                            ClientCity = reader["Cust City"] as string,
                            ClientState = reader["Cust State"] as string,
                            ClientZip = reader["Cust Zip"] as string,
                            PrimaryContactName = reader["Contact Name"] as string,
                            PrimaryContactAddress = reader["Contact Address"] as string,
                            PrimaryContactAddress2 = reader.IsDBNull(
                                reader.GetOrdinal("Contact Address 2")
                            )
                                ? null
                                : reader["Contact Address 2"].ToString(),
                            PrimaryContactCity = reader["Contact City"] as string,
                            PrimaryContactState = reader["Contact State"] as string,
                            PrimaryContactZip = reader["Contact Zip"] as string,
                            RepID = reader.IsDBNull(reader.GetOrdinal("Rep ID"))
                                ? null
                                : reader["Rep ID"].ToString(),
                            EstablishedDate = reader["Client Since"] as DateTime?,
                            AccountStatus = reader["Acct Status"] as bool?,
                            JurisdictionCountry = reader["Jurisdiction Country"] as string,
                            JurisdictionState = reader["Jurisdiction State"] as string,
                            AccountPassword = reader["Acct Pass"] as string,
                            BranchLocation = reader["Branch Location"] as string,
                            CustTaxId = reader["Cust Tax ID"] as string,
                            AtmLimit = reader["ATM Limit"] as int?,
                            AchLimit = reader["ACH Limit"] as int?,
                            WireLimit = reader["Wire Limit"] as int?,
                            EmailAddress = reader["Cust Email"] as string,
                            WebBanking = reader["Web"] as bool?,
                            MobileBanking = reader["Mobile"] as bool?,
                            TwoFactor = reader["Two Factor"] as bool?,
                            Biometrics = reader["Biometrics"] as bool?,
                            AcctObjective = reader["Acct Objective"] is DBNull ? (byte?)null : Convert.ToByte(reader["Acct Objective"]),
                            AcctFunding = reader["Acct Funding"] is DBNull ? (byte?)null : Convert.ToByte(reader["Acct Funding"]),
                            AcctPurpose = reader["Acct Purpose"] is DBNull ? (byte?)null : Convert.ToByte(reader["Acct Purpose"]),
                            AcctActivity = reader["Acct Activity"] is DBNull ? (byte?)null : Convert.ToByte(reader["Acct Activity"])
                        };
                    }
                }
            }
            return accountOverview;
        }

        public string AccountHolderCustomerID { get; set; }
        public string AccountHolderFirstLastName { get; set; }
        public string AccountHolderTaxID { get; set; }
        public string AccountHolderAddress { get; set; }
        public string AccountHolderCity { get; set; }
        public string AccountHolderState { get; set; }
        public string AccountHolderZip { get; set; }

        public static IEnumerable<AccountOverviewModel> GetAccountHoldersByAcctNum(string acctNum)
        {
            var accountHolders = new List<AccountOverviewModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctHolderByAcctNum]";

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
                        var accountHolder = new AccountOverviewModel
                        {
                            AccountHolderFirstLastName = reader["First & Last Name"] as string,
                            AccountHolderCustomerID = reader["Cust ID"] as string,
                            AccountHolderTaxID = reader["Tax ID"] as string,
                            AccountHolderAddress = reader["Address"] as string,
                            AccountHolderCity = reader["City"] as string,
                            AccountHolderState = reader["State"] as string,
                            AccountHolderZip = reader["Zip"] as string
                        };
                        accountHolders.Add(accountHolder);
                    }
                }
            }
            return accountHolders;
        }
    
        public string BeneFirstLastName { get; set; }
        public string BeneCustomerID { get; set; }
        public string BeneTaxID { get; set; }
        public string BeneRelationship { get; set; }
        public decimal? BenePortion { get; set; }

        public static IEnumerable<AccountOverviewModel> GetAccountBeneByAcctNum(string acctNum)
        {
            var accountBenes = new List<AccountOverviewModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctBeneByAcctNum]";

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
                        var accountBene = new AccountOverviewModel
                        {
                            BeneFirstLastName = reader["First & Last Name"] as string,
                            BeneCustomerID = reader["Cust ID"] as string,
                            BeneTaxID = reader["Tax ID"] as string,
                            BeneRelationship = reader["Relationship"] as string,
                            BenePortion = reader["% Portion"] as decimal?
                        };
                        accountBenes.Add(accountBene);
                    }
                }
            }
            return accountBenes;
        }

        public string POAFirstLastName { get; set; }
        public string POACustomerID { get; set; }
        public string POATaxID { get; set; }
        public string POARole { get; set; }

        public static IEnumerable<AccountOverviewModel> GetAccountPOAByAcctNum(string acctNum)
        {
            var accountPOAs = new List<AccountOverviewModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[Acct_GetAcctPOAByAcctNum]";

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
                        var accountPOA = new AccountOverviewModel
                        {
                            POAFirstLastName = reader["First & Last Name"] as string,
                            POACustomerID = reader["Customer ID"] as string,
                            POATaxID = reader["Tax ID"] as string,
                            POARole = reader["Role"] as string
                        };
                        accountPOAs.Add(accountPOA);
                    }
                }
            }
            return accountPOAs;
        }
    }
}
