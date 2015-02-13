//This is the entry point of fluentnode and the file called when ```require('fluentnode')``` is called
//
//The objective of this file is to trigger the registration of the multiple default mappings


// adding coffee-script support, after this line we can import *.coffee files
require('coffee-script/register');

//global
require('./utils/globals');
require('./utils/encoding');

//asserts

require('./assert/assert_Array'   );
require('./assert/assert_Boolean' );
require('./assert/assert_Function');
require('./assert/assert_Number'  );
require('./assert/assert_Object'  );
require('./assert/assert_String'  );

//core Javascript classes

require('./js-native/Array'    );
require('./js-native/Boolean'  );
require('./js-native/Function' );
require('./js-native/Number'   );
require('./js-native/Object'   );
require('./js-native/String'   );

//code NodeJS classes
require('./node-native/console'  );
require('./node-native/crypto' );
require('./node-native/http'   );
require('./node-native/fs'     );
require('./node-native/path'   );
require('./node-native/process');
