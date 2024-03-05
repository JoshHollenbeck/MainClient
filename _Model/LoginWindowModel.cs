using System;
using System.Data.SqlClient;
using System.Security;
using System.Security.Cryptography;
using MainClient.Utilities;

namespace MainClient._Model
{
    public class LoginWindowModel
    {
        public bool Login(string username, SecureString password)
        {
            // Convert the SecureString password to a byte array
            byte[] passwordBytes = ConvertSecureStringToByteArray(password);

            // Connection string to the database
            string connectionString = Connection.connectionString;

            // Name of your stored procedure
            string storedProcedure = "[dbo].[LoginEmployee]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                command.Parameters.Add(new SqlParameter("@inputRepID", username));
                command.Parameters.Add(new SqlParameter("@inputPassword", new System.Net.NetworkCredential(string.Empty, password).Password)); // Convert SecureString to String

                // Add the output parameter for the message
                SqlParameter messageOutput = new SqlParameter();
                messageOutput.ParameterName = "@LoginMessage";
                messageOutput.SqlDbType = System.Data.SqlDbType.VarChar;
                messageOutput.Size = 50; // Assume your message will not be longer than 50 characters
                messageOutput.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(messageOutput);

                // Open the connection and execute the stored procedure
                connection.Open();
                command.ExecuteNonQuery();

                // Read the message from the output parameter
                string message = command.Parameters["@LoginMessage"].Value.ToString();

                return message == "Login successful"; // Assuming the stored procedure returns "Success" for a successful login 
            }
        }

        private byte[] ConvertSecureStringToByteArray(SecureString secureString)
        {
            byte[] passwordBytes = new byte[secureString.Length * sizeof(char)];
            IntPtr ptr = IntPtr.Zero;

            try
            {
                ptr = System.Runtime.InteropServices.Marshal.SecureStringToGlobalAllocUnicode(secureString);
                System.Runtime.InteropServices.Marshal.Copy(ptr, passwordBytes, 0, passwordBytes.Length);
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

        private byte[] CalculateHash(byte[] passwordBytes, byte[] salt)
        {
            // Use a secure hashing algorithm, such as SHA-256
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] combinedBytes = new byte[passwordBytes.Length + salt.Length];
                Array.Copy(passwordBytes, 0, combinedBytes, 0, passwordBytes.Length);
                Array.Copy(salt, 0, combinedBytes, passwordBytes.Length, salt.Length);

                return sha256.ComputeHash(combinedBytes);
            }
        }

        private bool CompareByteArrays(byte[] array1, byte[] array2)
        {
            if (array1.Length != array2.Length)
            {
                return false;
            }

            for (int i = 0; i < array1.Length; i++)
            {
                if (array1[i] != array2[i])
                {
                    return false;
                }
            }

            return true;
        }
    }
}