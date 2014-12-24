//This is the entry point of fluentnode and the file called when ```require('fluentnode')``` is called
//
//The objective of this file is to trigger the registration of the multiple default mappings


// adding coffee-script support, after this line we can import *.coffee files
require('coffee-script/register');

//asserts

require('./assert/assert_Array'   );
require('./assert/assert_Boolean' );
require('./assert/assert_Function');
require('./assert/assert_Number'  );
require('./assert/assert_Object'  );
require('./assert/assert_String'  );

//core Javascript classes

require('./Array'    );
require('./Boolean'  );
require('./console'  );
require('./Function' );
require('./Number'   );
require('./Object'   );
require('./String'   );

//code NodeJS classes

require('./http'     );
require('./fs'       );

require('./path'     );
require('./process'  );


require('./_to_map_and_write_Tests');
