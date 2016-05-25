var mysql =require('mysql');
var sql = require('../config/sql.js');
var connection = require('../config/database');
var connect = mysql.createConnection(connection.dbconfig)
	connect.connect(function(err){
	if(!err)
	console.log("done connection in admin");
	else
	console.log("error in connection");
	});
//============================getcity data========================
exports.getcity = function (callback) {
            var query = "SELECT city_id,city_name from city" ;
            sql.executeSql(query, function (data, err) {
                        if (err) {
                                        callback(err, null);
                        }
                       else {
                                        callback(null, data);
                        }
          });
}
