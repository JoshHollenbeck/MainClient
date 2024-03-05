using System;
using MainClient._Model;
using System.Collections.ObjectModel;
using Microsoft.Data.SqlClient;
using MainClient.Utilities;

namespace MainClient._ViewModel
{
    class ClientOverviewVM : ViewModelBase
    {
        // // An ObservableCollection to hold customer overview models.
        // public ObservableCollection<ClientOverviewModel> CustOverviewCollection { get; set; }

        // // A property to store the selected customer overview model.
        // public ClientOverviewModel SelectedCustOverview { get; set; }

        // Constructor for the ClientOverviewVM class.
        public ClientOverviewVM()
        {
            // Call the LoadTypes method when an instance of this class is created.
        //     LoadTypes();
        }

        // // A private method to retrieve a nullable value from a SqlDataReader.
        // private T? GetNullableValue<T>(
        //     SqlDataReader reader,
        //     string columnName,
        //     Func<int, T> getValueFunc
        // )
        //     where T : struct
        // {
        //     // Get the ordinal (position) of the specified column in the result set.
        //     int ordinal = reader.GetOrdinal(columnName);
        //     // Check if the column value is DBNull. If it is, return null; otherwise, call getValueFunc to get the value.
        //     return reader.IsDBNull(ordinal) ? (T?)null : getValueFunc(ordinal);
        // }

        // // A method to get a string or null from a SqlDataReader based on column name.
        // public string GetStringOrNull(SqlDataReader reader, String columnName)
        // {
        //     // Get the ordinal (position) of the specified column in the result set.
        //     int ordinal = reader.GetOrdinal(columnName);

        //     // Check if the column value is DBNull.
        //     if (!reader.IsDBNull(ordinal))
        //     {
        //         // Check the type of the column value and return it as a string.
        //         if (reader.GetFieldType(ordinal) == typeof(string))
        //         {
        //             return reader.GetString(ordinal);
        //         }
        //         else if (reader.GetFieldType(ordinal) == typeof(int))
        //         {
        //             // If it's an integer, convert it to a string and return.
        //             return reader.GetInt32(ordinal).ToString();
        //         }
        //     }
        //     // Return null if the column value is DBNull or doesn't match the expected types.
        //     return null;
        // }

        // public void LoadTypes()
        // {
        //     // Create a new ObservableCollection to store customer overview models.
        //     CustOverviewCollection = new ObservableCollection<ClientOverviewModel>();

        //     // Create a new SqlConnection using the connection string from a class named "Connection."
        //     using (SqlConnection connection = new SqlConnection(Connection.connectionString))
        //     {
        //         // Open the database connection.
        //         connection.Open();
        //         // Define a SQL query.
        //         string cust_overview_query =
        //             @"
        //             SELECT acct_num,
        //             a.cust_id,
        //             voice_auth,
        //             first_name,
        //             middle_name,
        //             last_name,
        //             suffix,
        //             do_not_call,
        //             share_affiliates,
        //             date_of_birth,
        //             mothers_maiden,
        //             client_since,
        //             id_type,
        //             id_state,
        //             id_num,
        //             id_exp,
        //             phone_home,
        //             phone_business,
        //             email,
        //             address,
        //             address_2,
        //             zip,
        //             city,
        //             state,
        //             employment_status,
        //             employer_name,
        //             occupation,
        //             acct_num,
        //             acct_nickname, 
        //             acct_pass,
        //             acct_type,
        //             registration_name,
        //             acct_bal,
        //             i.city,
        //             i.state,
        //             i.zip
        //             FROM acct_info a
        //             JOIN cust_emp b ON a.cust_id = b.cust_id
        //             JOIN cust_privacy c ON a.cust_id = c.cust_id
        //             JOIN cust_contact d ON a.cust_id = d.cust_id
        //             JOIN cust_info e ON a.cust_id = e.cust_id
        //             JOIN acct_pass f ON a.acct_id = f.acct_id
        //             JOIN cust_id g ON a.cust_id = g.cust_id
        //             JOIN acct_bal h ON a.acct_id = h.acct_id
        //             JOIN acct_branch i ON a.acct_id = i.acct_id
        //             WHERE a.acct_num = 70162605;
        //         ";
        //         // Create a new SqlCommand using the SQL query and the database connection.
        //         using (SqlCommand command = new SqlCommand(cust_overview_query, connection))
        //         using (SqlDataReader reader = command.ExecuteReader())
        //         {
        //             // Read data from the SqlDataReader in a loop until there's no more data.
        //             while (reader.Read())
        //             {
        //                 // Create a new CustOverviewModel and populate its properties using data from the SqlDataReader.
        //                 SelectedCustOverview = new ClientOverviewModel
        //                 {
        //                     // Use the GetNullableValue method to retrieve nullable integer values.
        //                     CustID = GetNullableValue(reader, "cust_id", reader.GetInt32),
        //                     VoiceAuth = GetNullableValue(reader, "voice_auth", reader.GetBoolean),
        //                     DoNotCall = GetNullableValue(reader, "do_not_call", reader.GetBoolean),
        //                     ShareWithAffiliates = GetNullableValue(reader, "share_affiliates", reader.GetBoolean),
        //                     DateOfBirth = GetNullableValue(reader, "date_of_birth", reader.GetDateTime),
        //                     ClientSince = GetNullableValue(reader, "client_since", reader.GetDateTime),
        //                     IDType = GetNullableValue(reader, "id_type", reader.GetInt32),
        //                     EmploymentStatus = GetNullableValue(reader, "employment_status", reader.GetBoolean),
        //                     AcctNum = GetNullableValue(reader, "acct_num", reader.GetInt32),
        //                     AcctType = GetNullableValue(reader, "acct_type", reader.GetInt32),
        //                     // Use GetStringOrNull method to retrieve string values or null if the value is DBNull.
        //                     FirstName = GetStringOrNull(reader, "first_name"),
        //                     MiddleName = GetStringOrNull(reader, "middle_name"),
        //                     LastName = GetStringOrNull(reader, "last_name"),
        //                     Suffix = GetStringOrNull(reader, "suffix"),
        //                     MothersMaiden = GetStringOrNull(reader, "mothers_maiden"),
        //                     IDState = GetStringOrNull(reader, "id_state"),
        //                     IDNum = GetStringOrNull(reader, "id_num"),
        //                     ExpDate = GetStringOrNull(reader, "id_exp"),
        //                     HomePhone = GetStringOrNull(reader, "phone_home"),
        //                     WorkPhone = GetStringOrNull(reader, "phone_business"),
        //                     EmailAddress = GetStringOrNull(reader, "email"),
        //                     Address = GetStringOrNull(reader, "address"),
        //                     AddressLine2 = GetStringOrNull(reader, "address_2"),
        //                     City = GetStringOrNull(reader, "city"),
        //                     State = GetStringOrNull(reader, "state"),
        //                     Zip = GetStringOrNull(reader, "zip_code"),
        //                     DomicleBranchCity = GetStringOrNull(reader, "city"),
        //                     DomicleBranchState = GetStringOrNull(reader, "state"),                           
        //                     EmployerName = GetStringOrNull(reader, "employer_name"),
        //                     Occupation = GetStringOrNull(reader, "occupation"),
        //                     AcctNickname = GetStringOrNull(reader, "acct_nickname"),
        //                     AcctBalance = GetNullableValue(reader, "acct_bal", reader.GetDecimal),
        //                     AcctPass = GetStringOrNull(reader, "acct_pass"),
        //                     AcctRegistration = GetStringOrNull(reader, "registration_name")
        //                 };
        //             }
        //         }
        //         // Close the database connection.
        //         connection.Close();
        //     }
        // }
    }
}
