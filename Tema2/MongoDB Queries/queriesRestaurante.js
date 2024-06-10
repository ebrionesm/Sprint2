//1
find();
//2
find( {},{ restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });
//3
find( {},{ restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id : 0 });
//4
find( {}, { restaurant_id: 1, name: 1, borough: 1, 'address.zipcode': 1, _id: 0 });
//5
find({ borough: 'Bronx' });
//6
find({ borough: 'Bronx' }).limit(5);
//7
find({ borough: 'Bronx' }).limit(5).skip(5);
//8
find({'grades.score' : {"$gt" : 90}});
//9
find({'grades.score': { $gt: 80, $lt: 100 } });
//10
find({'address.coord': { $lt: -95.754168 }});
//11
find({ cuisine: { $ne: 'American ' }, 'grades.score': { $gt: 70 }, 'address.coord': { $lt: -65.754168 } });
//12
find( {$and: [ { cuisine: { $ne: 'American ' } },{ 'grades.score': { $gt: 70 } },{ 'address.coord': { $lt: -65.754168 } } ] } );
//13
find({ cuisine: { $ne: 'American ' }, 'grades.grade': 'A', borough: { $ne: 'Brooklyn' } }).sort({ cuisine: -1 });
//14
find({ name: { $regex: RegExp('^Wil') } },{ restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 });
//15
find( { name: { $regex: RegExp('ces$') } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 } );
//16
find( { name: { $regex: 'Reg' } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 } );
//17
find({ $and: [{ borough: 'Bronx' }, { $or: [ { cuisine: 'American ' }, { cuisine: 'Chinese' } ] } ] });
//18
find({ $or: [{ borough: 'Staten Island' }, { borough: 'Queens' }, { borough: 'Bronx' }, { borough: 'Brooklyn' } ] }, { restaurant_id: 1, name: 1,borough: 1, cuisine: 1, _id: 0 });
//19
find( { $and: [{ borough: { $ne: 'Staten Island' } }, { borough: { $ne: 'Queens' } }, { borough: { $ne: 'Bronx' } }, { borough: { $ne: 'Brooklyn' } }] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 } );
//20
find( { 'grades.score': { $lt: 10 } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 } );
//21
find({ $and: [ { cuisine: 'Seafood' }, { cuisine: { $ne: { $regex: RegExp('American') } } }, { cuisine: { $ne: { $regex: RegExp('Chinese') } } }, { name: { $ne: { $regex: RegExp('^Wil') } } } ] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 });
//22
find({ $and: [ { 'grades.grade': 'A' }, { 'grades.score': 11 }, { 'grades.date': ISODate('2014-08-11T00:00:00.000Z')}] }, { restaurant_id: 1, name: 1, grades: 1, _id: 0 });
//23
find({ $and: [ { 'grades.1.grade': 'A' }, { 'grades.1.score': 9 }, { 'grades.1.date': ISODate( '2014-08-11T00:00:00.000Z') }] }, { restaurant_id: 1, name: 1, grades: 1, _id: 0 });
//24
find({ $and: [ { 'address.coord.1': { $gt: 42 } }, { 'address.coord.1': { $lt: 52 } }] }, { restaurant_id: 1, name: 1, 'address.street': 1, 'address.coord': 1, _id: 0 });
//25
find({}).sort({ name: 1 });
//26
find({}).sort({ name: -1 });
//27
find({}).sort({ cuisine : 1, borough : -1 });
//28
find({'address.street': { $exists: true }});
//29
find({'address.coord': { $type: 'int' }});
//30
find( { 'grades.score': { $mod: [7, 0] } }, { restaurant_id: 1, name: 1, 'grades.grade': 1, _id: 0 });
//31
find({ name: { $regex: 'mon' } }, { name: 1, borough: 1, 'address.coord': { $slice: 2 }, cuisine: 1, _id: 0 } );
//32
find( { name: { $regex: '^Mad' } }, { name: 1, borough: 1, 'address.coord': { $slice: 2 }, cuisine: 1, _id: 0 });