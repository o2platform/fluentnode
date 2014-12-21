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

require('./fluent-array'    );
require('./fluent-assert'   );
require('./fluent-boolean'  );
require('./fluent-console'  );
require('./fluent-http'     );
require('./fluent-fs'       );
require('./fluent-function' );
require('./fluent-number'   );
require('./fluent-object'   );
require('./fluent-path'     );
require('./fluent-process'  );
require('./fluent-string'   );
