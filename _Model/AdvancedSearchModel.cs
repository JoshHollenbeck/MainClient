using System.Data.SqlClient;
using System.Collections.Generic;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class AdvancedSearchModel
    {
        public class SearchResult
        {
            public string AccountNumber { get; set; }
            public string FirstLastName { get; set; }
            public string CustomerID { get; set; }
            public string AccountAddress { get; set; }
            public string AccountCity { get; set; }
            public string AccountState { get; set; }
            public string AccountZip { get; set; }
        }

        public List<SearchResult> AcctAdvancedSearch(
            string lastName,
            string firstName,
            string middleIntial,
            string custSecondaryId,
            string custPhone,
            string custZip,
            string custTaxId,
            string acctNum,
            string custEmail
        )
        {
            List<SearchResult> searchResults = new List<SearchResult>();
            
            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
            string storedProcedure = "[dbo].[Acct_AdvancedSearch]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {   
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                command.Parameters.Add(new SqlParameter("@LastName", lastName));
                command.Parameters.Add(new SqlParameter("@FirstName", firstName));
                command.Parameters.Add(new SqlParameter("@MiddleInitial", middleIntial));
                command.Parameters.Add(new SqlParameter("@CustSecondaryID", custSecondaryId));
                command.Parameters.Add(new SqlParameter("@CustPhone", custPhone));
                command.Parameters.Add(new SqlParameter("@CustZip", custZip));
                command.Parameters.Add(new SqlParameter("@CustTaxID", custTaxId));
                command.Parameters.Add(new SqlParameter("@AcctNum", acctNum));
                command.Parameters.Add(new SqlParameter("@CustEmail", custEmail));

                // Open the connection to the database
                connection.Open();
                
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        SearchResult result = new SearchResult
                        {
                            AccountNumber = reader["Account Number"].ToString(),
                            FirstLastName = reader["First & Last Name"].ToString(),
                            CustomerID = reader["Customer Id"].ToString(),
                            AccountAddress = reader["Address"].ToString(),
                            AccountCity = reader["City"].ToString(),
                            AccountState = reader["State"].ToString(),
                            AccountZip = reader["Zip"].ToString(),
                        };
                        searchResults.Add(result);
                    }
                }

                return searchResults;
            }
        }
    }
}