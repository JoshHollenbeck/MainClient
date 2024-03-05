using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using MainClient.Utilities;
using System.Windows.Navigation;
using MainClient._View;

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
        public int? AcctObjective { get; set; }
        public int? AcctFunding { get; set; }
        public int? AcctPurpose { get; set; }
        public int? AcctActivity { get; set; }
        public string POAFirstName { get; set; }
        public string POALastName { get; set; }
        public string POARole { get; set; }
        public string POACustomerID { get; set; }
        public string POATaxID { get; set; }

        public static AccountOverviewModel GetAccountDetailsByAcctNum(string acctNum)
        {
            AccountOverviewModel accountOverview = null;

            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
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
                            InitialContactMethod = reader["initial_contact_method"] as string,
                            AccountType = reader["acct_type"] as string,
                            RegistrationName = reader["registration_name"] as string,
                            ClientFirstName = reader["first_name"] as string,
                            ClientMiddleName = reader.IsDBNull(reader.GetOrdinal("middle_name"))
                                ? null
                                : reader["middle_name"].ToString(),
                            ClientLastName = reader["last_name"] as string,
                            ClientSuffix = reader.IsDBNull(reader.GetOrdinal("suffix"))
                                ? null
                                : reader["suffix"].ToString(),
                            ClientAddress = reader["cust_address"] as string,
                            ClientAddress2 = reader["cust_address_2"] as string,
                            ClientCity = reader["cust_city"] as string,
                            ClientState = reader["cust_state"] as string,
                            ClientZip = reader["cust_zip"] as string,
                            PrimaryContactName = reader["contact_name"] as string,
                            PrimaryContactAddress = reader["contact_address"] as string,
                            PrimaryContactAddress2 = reader.IsDBNull(
                                reader.GetOrdinal("contact_address_2")
                            )
                                ? null
                                : reader["contact_address_2"].ToString(),
                            PrimaryContactCity = reader["contact_city"] as string,
                            PrimaryContactState = reader["contact_state"] as string,
                            PrimaryContactZip = reader["contact_zip"] as string,
                            RepID = reader.IsDBNull(reader.GetOrdinal("rep_id"))
                                ? null
                                : reader["rep_id"].ToString(),
                            EstablishedDate = reader["client_since"] as DateTime?,
                            AccountStatus = reader["acct_status"] as bool?,
                            JurisdictionCountry = reader["jurisdiction_country"] as string,
                            JurisdictionState = reader["jurisdiction_state"] as string,
                            AccountPassword = reader["acct_pass"] as string,
                            BranchLocation = reader["cust_city"] as string,
                            CustTaxId = reader["cust_tax_id"] as string,
                            AtmLimit = reader["atm_limit"] as int?,
                            AchLimit = reader["ach_limit"] as int?,
                            WireLimit = reader["wire_limit"] as int?,
                            EmailAddress = reader["cust_email"] as string,
                            WebBanking = reader["web"] as bool?,
                            MobileBanking = reader["mobile"] as bool?,
                            TwoFactor = reader["two_factor"] as bool?,
                            Biometrics = reader["biometrics"] as bool?,
                            AcctObjective = reader["acct_objective"] as int?,
                            AcctFunding = reader["acct_funding"] as int?,
                            AcctPurpose = reader["acct_purpose"] as int?,
                            AcctActivity = reader["acct_activity"] as int?
                        };
                    }
                }
            }
            return accountOverview;
        }

        public static AccountOverviewModel GetAccountPOAByAcctNum(string acctNum)
        {
            AccountOverviewModel poaOverview = null;

            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
            string storedProcedure = "[dbo].[GetAccountPOAByAcctNum]";

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
                        poaOverview = new AccountOverviewModel
                        {
                            POACustomerID = reader["poa_cust_id"] as string,
                            POARole = reader["poa_role"] as string,
                            POAFirstName = reader["poa_first_name"] as string,
                            POALastName = reader["poa_last_name"] as string,
                            POATaxID = reader["poa_tax_id"] as string,
                        };
                    }
                }
            }
            return poaOverview;
        }
    }
}
