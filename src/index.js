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

require('./assert/Array'   );
require('./assert/Boolean' );
require('./assert/Function');
require('./assert/Number'  );
require('./assert/Object'  );
require('./assert/String'  );
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
