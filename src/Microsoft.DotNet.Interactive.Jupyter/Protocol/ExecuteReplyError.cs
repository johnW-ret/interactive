// Copyright (c) .NET Foundation and contributors. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Microsoft.DotNet.Interactive.Jupyter.Protocol;

[JupyterMessageType(JupyterMessageContentTypes.ExecuteReply)]
public class ExecuteReplyError : ExecuteReply
{
    [JsonConstructor]
    public ExecuteReplyError(string eName, string eValue, int executionCount = 0,IReadOnlyList<string> traceback = null) : base(StatusValues.Error, executionCount: executionCount)
    {
        Traceback = traceback ?? new List<string>();
        EName = eName;
        EValue = eValue;
    }

    public ExecuteReplyError(Error error,int executionCount = 0, IReadOnlyList<string> traceback = null) : this(error.EName, error.EValue, executionCount, traceback)
    {
           
    }

    [JsonPropertyName("ename")]
    public string EName { get; }

    [JsonPropertyName("evalue")]
    public string EValue { get;  }

    [JsonPropertyName("traceback")]
    public IReadOnlyList<string> Traceback { get;} 
}