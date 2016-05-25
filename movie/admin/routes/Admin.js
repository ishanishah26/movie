var express = require('express');
var router = express.Router();
var admin=require('../model/admin.js');
//======================city============
router.get('/city',function(req,res){
  res.render('city',{title:'manage city'});
});


router.get('/getcity', function (req, res) {
    admin.getcity(function (data,err) {
        if (!err) {
                      res.render('city',{city:data});
                      //res.json({data:data});
                      return;
        }
        else {
          console.log(err);
                    //  res.render('404');
                    res.send("something bad happened");
                      return;
        }
    });
});
module.exports = router;
