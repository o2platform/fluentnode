// [Table of contents](fluent.html)
//
// this is the entry point of fluentnode and the file called when ```require('fluentnode')``` is called
//
//

/*jslint node: true */
"use strict";

// adding coffee-script support, after this line we can import *.coffee files
require('coffee-script/register');

// adding the multiple fluentnode files

require('./assert/assert_Array'   );
require('./assert/assert_Boolean' );
require('./assert/assert_Function');
require('./assert/assert_Number'  );
require('./assert/assert_Object'  );
require('./assert/assert_String'  );
require('./Array'    );
require('./Boolean'  );
require('./console'  );
require('./http'     );
require('./fs'       );
require('./Function' );
require('./Number'   );
require('./Object'   );
require('./path'     );
require('./process'  );
require('./String'   );

require('./_to_map_and_write_Tests');