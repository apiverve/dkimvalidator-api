using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.DKIMValidator
{
    /// <summary>
    /// Query options for the DKIM Validator API
    /// </summary>
    public class DKIMValidatorQueryOptions
    {
        /// <summary>
        /// The domain to validate the DKIM record for
        /// Example: google.com
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }
    }
}
