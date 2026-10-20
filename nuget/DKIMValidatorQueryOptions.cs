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
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }

        /// <summary>
        /// The DKIM selector to look up (the label before ._domainkey). When omitted, a list of common selectors is tried
        /// </summary>
        [JsonProperty("selector")]
        public string Selector { get; set; }
    }
}
