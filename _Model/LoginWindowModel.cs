using System;
using System.Data.SqlClient;
using System.Security;
using MainClient.Utilities;
using MainClient.Services;
using System.Windows;

namespace MainClient._Model
{
    public class LoginWindowModel
    {
        public (bool Result, string RepId, bool Trading, bool MoveMoney, bool ViewOnly) Login(
            string username,
            SecureString password
        )
        {
            // Convert the SecureString password to a byte array
            byte[] passwordBytes = ConvertSecureStringToByteArray(password);

            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
            string storedProcedure = "[dbo].[MainClient_LoginEmployee]";

            bool trading = false;
            bool moveMoney = false;
            bool viewOnly = false;
            string repId = string.Empty;
            bool result = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                command.Parameters.Add(new SqlParameter("@inputRepID", username));
                command.Parameters.Add(
                    new SqlParameter(
                        "@inputPassword",
                        new System.Net.NetworkCredential(string.Empty, password).Password
                    )
                ); // Convert SecureString to String

                // Add the output parameter for the message
                SqlParameter messageOutput = new SqlParameter();
                messageOutput.ParameterName = "@LoginMessage";
                messageOutput.SqlDbType = System.Data.SqlDbType.VarChar;
                messageOutput.Size = 50; // Assume your message will not be longer than 50 characters
                messageOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(messageOutput);

                SqlParameter repIdOutput = new SqlParameter(
                    "@RepId",
                    System.Data.SqlDbType.VarChar
                );
                repIdOutput.Size = 5; // Adjust the size according to your schema's requirements
                repIdOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(repIdOutput);
                
                SqlParameter tradingOutput = new SqlParameter(
                    "@Trading",
                    System.Data.SqlDbType.Bit
                );
                tradingOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(tradingOutput);

                SqlParameter moveMoneyOutput = new SqlParameter(
                    "@MoveMoney",
                    System.Data.SqlDbType.Bit
                );
                moveMoneyOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(moveMoneyOutput);

                SqlParameter viewOnlyOutput = new SqlParameter(
                    "@ViewOnly",
                    System.Data.SqlDbType.Bit
                );
                viewOnlyOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(viewOnlyOutput);

                // Open the connection and execute the stored procedure
                connection.Open();
                command.ExecuteNonQuery();

                // Read the message from the output parameter
                string message = command.Parameters["@LoginMessage"].Value.ToString();
                result = message == "Login successful";
                repId = command.Parameters["@RepId"].Value.ToString();
                trading = Convert.ToBoolean(command.Parameters["@trading"].Value);
                moveMoney = Convert.ToBoolean(command.Parameters["@MoveMoney"].Value);
                viewOnly = Convert.ToBoolean(command.Parameters["@ViewOnly"].Value);
            }

            return (result, repId, trading, moveMoney, viewOnly);
        }

        private byte[] ConvertSecureStringToByteArray(SecureString secureString)
        {
            byte[] passwordBytes = new byte[secureString.Length * sizeof(char)];
            IntPtr ptr = IntPtr.Zero;

            try
            {
                ptr = System.Runtime.InteropServices.Marshal.SecureStringToGlobalAllocUnicode(
                    secureString
                );
                System.Runtime.InteropServices.Marshal.Copy(
                    ptr,
                    passwordBytes,
                    0,
                    passwordBytes.Length
                );
            }
            finally
            {
                if (ptr != IntPtr.Zero)
                {
                    System.Runtime.InteropServices.Marshal.ZeroFreeGlobalAllocUnicode(ptr);
                }
            }

            return passwordBytes;
        }

        public (bool Result, string RepId, bool Trading, bool MoveMoney, bool ViewOnly) LoginBypass()
        {
            string username = "0MTJN";
            SecureString password = new SecureString();
            foreach (char c in "$1sbcWwp")
            {   
                password.AppendChar(c);
            }
            password.MakeReadOnly();

            // Convert the SecureString password to a byte array
            byte[] passwordBytes = ConvertSecureStringToByteArray(password);

            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
            string storedProcedure = "[dbo].[MainClient_LoginEmployee]";

            bool trading = false;
            bool moveMoney = false;
            bool viewOnly = false;
            string repId = string.Empty;
            bool result = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                command.Parameters.Add(new SqlParameter("@inputRepID", username));
                command.Parameters.Add(
                    new SqlParameter(
                        "@inputPassword",
                        new System.Net.NetworkCredential(string.Empty, password).Password
                    )
                ); // Convert SecureString to String

                // Add the output parameter for the message
                SqlParameter messageOutput = new SqlParameter();
                messageOutput.ParameterName = "@LoginMessage";
                messageOutput.SqlDbType = System.Data.SqlDbType.VarChar;
                messageOutput.Size = 50; // Assume your message will not be longer than 50 characters
                messageOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(messageOutput);

                SqlParameter repIdOutput = new SqlParameter(
                    "@RepId",
                    System.Data.SqlDbType.VarChar
                );
                repIdOutput.Size = 5; // Adjust the size according to your schema's requirements
                repIdOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(repIdOutput);

                SqlParameter tradingOutput = new SqlParameter(
                    "@Trading",
                    System.Data.SqlDbType.Bit
                );
                tradingOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(tradingOutput);

                SqlParameter moveMoneyOutput = new SqlParameter(
                    "@MoveMoney",
                    System.Data.SqlDbType.Bit
                );
                moveMoneyOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(moveMoneyOutput);

                SqlParameter viewOnlyOutput = new SqlParameter(
                    "@ViewOnly",
                    System.Data.SqlDbType.Bit
                );
                viewOnlyOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(viewOnlyOutput);

                // Open the connection and execute the stored procedure
                connection.Open();
                command.ExecuteNonQuery();

                // Read the message from the output parameter
                string message = command.Parameters["@LoginMessage"].Value.ToString();
                result = message == "Login successful";
                repId = command.Parameters["@RepId"].Value.ToString();
                trading = Convert.ToBoolean(command.Parameters["@trading"].Value);
                moveMoney = Convert.ToBoolean(command.Parameters["@MoveMoney"].Value);
                viewOnly = Convert.ToBoolean(command.Parameters["@ViewOnly"].Value);
            }

            // Return the results as a tuple
            return (result, repId, trading, moveMoney, viewOnly);
        }
    }
}
