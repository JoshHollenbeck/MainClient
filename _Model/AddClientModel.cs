using System.Data.SqlClient;
using MainClient.Utilities;
using System.Collections.Generic;

namespace MainClient._Model
{
    // TODO set up these LU_tables
    public class AddClientModel
    {
        public string IdName { get; set; }

        public static IEnumerable<AddClientModel> LookUpIdType()
        {
            var idTypeLists = new List<AddClientModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[MainClient_LookUpIdType]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var idTypeList = new AddClientModel
                        {
                            IdName = reader[0] as string
                        };
                        idTypeLists.Add(idTypeList);
                    }
                }
            }
            return idTypeLists;
        }

        public string StateAbbr { get; set; }
        
        public string StateName { get; set; }

        public static IEnumerable<AddClientModel> LookUpState()
        {
            var stateTypeLists = new List<AddClientModel>();

            string connectionString = Connection.connectionString;

            string storedProcedure = "[dbo].[MainClient_LookUpState]";

            using (SqlConnection connection = new SqlConnection(connectionString))

            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var stateTypeList = new AddClientModel
                        {
                            StateAbbr = reader[0] as string,
                            StateName = reader[1] as string
                        };
                        stateTypeLists.Add(stateTypeList);
                    }
                }
            }
            return stateTypeLists;
        }
    }
}
