using MainClient.Utilities;
using System.Collections.ObjectModel;
using Microsoft.Data.SqlClient;

namespace MainClient._Model
{
    public class AddClientModel
    {
        public class IdTypeModel
        {
            public string IDName { get; set; }
        }

        public class StateModel
        {
            public string StateAbbr { get; set; }
            public string StateName { get; set; }
            public string State { get; set; }
        }

        public class MonthModel
        {
            public int MonthID { get; set; }
            public string MonthName { get; set; }
            public string Month { get; set; }
        }

        public ObservableCollection<IdTypeModel> IdTypeCollection { get; set; }
        public ObservableCollection<MonthModel> MonthCollection { get; set; }
        public ObservableCollection<StateModel> StateCollection { get; set; }

        public void LoadTypes()
        {
            IdTypeCollection = new ObservableCollection<IdTypeModel>();
            MonthCollection = new ObservableCollection<MonthModel>();
            StateCollection = new ObservableCollection<StateModel>();
                
            using (SqlConnection connection = new SqlConnection(Connection.connectionString))
            {
                connection.Open();
                string id_query = "SELECT id_type FROM LU_id_type";
                using (SqlCommand command = new SqlCommand(id_query, connection))
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        IdTypeCollection.Add(new IdTypeModel { IDName = reader.GetString(0) });
                    }
                }

                string state_query = "SELECT state_abbr, state_name from LU_state";
                using (SqlCommand command = new SqlCommand(state_query, connection))
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        StateCollection.Add(
                            new StateModel
                            {
                                StateAbbr = reader.GetString(0),
                                StateName = reader.GetString(1),
                                State = $"{reader.GetString(0)} - {reader.GetString(1)}"
                            }
                        );
                    }
                }

                string month_query = "SELECT month_id, month_name from LU_month";
                using (SqlCommand command = new SqlCommand(month_query, connection))
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        MonthCollection.Add(
                            new MonthModel
                            {
                                MonthID = reader.GetInt32(0),
                                MonthName = reader.GetString(1),
                                Month = $"{reader.GetInt32(0)} - {reader.GetString(1)}"
                            }
                        );
                    }
                }
                connection.Close();
            }
        }
    }
}
