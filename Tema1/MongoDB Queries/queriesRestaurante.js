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