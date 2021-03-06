﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.Object
{
    public class NewProduct
    {
        public int intProductId { get; set; }
        public string strName { get; set; }
        public string strDetails { get; set; }
        public string strUnit { get; set; }
        public double decUnitPerKG { get; set; }
        public double decTotal { get; set; }
        public string strProductURL { get; set; }
        public int intQuantity { get; set; }
        public string strRemark { get; set; }
    }
}