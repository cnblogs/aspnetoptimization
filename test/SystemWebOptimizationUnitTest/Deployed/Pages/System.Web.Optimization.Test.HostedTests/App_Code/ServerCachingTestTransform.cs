// Copyright (c) Microsoft Corporation, Inc. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System.Web.Optimization;

public class ServerCachingTestTransform : IBundleTransform {
    public static int ProcessCount;

    public void Process(BundleContext context, BundleResponse response) {
        ProcessCount++;
        response.Content = "Process Called: " + ProcessCount;
    }
}
