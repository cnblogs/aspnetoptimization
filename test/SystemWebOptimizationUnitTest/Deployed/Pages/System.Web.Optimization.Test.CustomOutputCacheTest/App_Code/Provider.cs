using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Caching;

namespace Test {
    public class MyCustomOutputCacheProvider : OutputCacheProvider {
        public override object Add(string key, object entry, DateTime utcExpiry) {
            return null;
        }

        public override object Get(string key) {
            return null;
        }

        public override void Remove(string key) {
        }

        public override void Set(string key, object entry, DateTime utcExpiry) {
        }
    }
}
