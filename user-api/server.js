const express = require('express');
const mysql = require('mysql');
const app = express();

app.use(express.json());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'IKFashionHub'
});

connection.connect(err => {
    if (err) throw err;
    console.log('Connected to MySQL database');
});


// This assumes you have a `sub_category` field in your `product` table.
app.get('/api/subCategory/:category', (req, res) => {
    const { category } = req.params;
    const sql = 'SELECT DISTINCT subCategory FROM Products WHERE category = ?';
    connection.query(sql, [category], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error', details: error });
        }
        const subCategories = results.map(row => row.sub_category);
        res.json(subCategories);
    });
});



// // Endpoint to get product variants by product ID
// app.get('/api/productVariants/:productId', (req, res) => {
//     const { productId } = req.params;
//     const sql = 'SELECT * FROM ProductVariants WHERE product_id = ?';
//     connection.query(sql, [productId], (error, results) => {
//         if (error) {
//             return res.status(500).json({ error: 'Database error', details: error });
//         }
//         res.json(results);
//     });
// });





// Endpoint to get all distinct categories
app.get('/api/category', (req, res) => {
    const sql = 'SELECT DISTINCT product_category FROM products';
    connection.query(sql, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        // Extract categories from the results
        const product_category = results.map(row => row.product_category);
        res.json(product_category);
    });
});



// Endpoint to get products by category
app.get('/api/Products/:category', (req, res) => {
    const { category } = req.params;
    const sql = 'SELECT * FROM Products WHERE category = ?';
    connection.query(sql, [category], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        res.json(results);
    });
});



// Endpoint to get products by category
app.get('/api/Products', (req, res) => {
    const { category } = req.params;
    const sql = 'SELECT * FROM Products';
    connection.query(sql, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        res.json(results);
    });
});


// Register user
app.post('/api/users/register', (req, res) => {
    const { fullName, telno, email, address, password } = req.body;
    const query = 'INSERT INTO users (fullName, telno, email, address, password) VALUES (?, ?, ?, ?, ?)';
    connection.query(query, [fullName, telno, email, address, password], (err, result) => {
        if (err) {
            res.status(500).json({ message: 'Error registering new user', error: err });
            return;
        }
        res.status(200).json({ message: 'User registered successfully', userId: result.email });
    });
});

// Authenticate user
app.post('/api/users/login', (req, res) => {
    const { email, password } = req.body;
    const query = 'select * from Users where email= ? and password= ?;';
    connection.query(query, [email, password], (err, results) => {
        if (err) {
            res.status(500).json({ message: 'Error retrieving user details', error: err });
            return;
        }
        if (results.length > 0) {
            res.status(200).json({ message: 'Login successful', userId: results[0].id });
        } else {
            res.status(401).json({ message: 'Invalid credentials' });
        }
    });
});

//get user
app.get('/api/users/:email', (req, res) => {
    const email = req.params.email;
    const query = `SELECT email,fullName,telno,address FROM Users WHERE email = '${email}'`;

    connection.query(query, (error, results, fields) => {
        if (error) {
            res.status(500).json({ error: 'Internal Server Error' });
        } else {
            if (results.length === 0) {
                res.status(404).json({ error: 'User not found' });
            } else {
                res.json(results[0]);
            }
        }
    });
});

// Insert into Cart
app.post('/api/cart', (req, res) => {
    const { item_id, user_id, size, qty } = req.body;
    const query = 'INSERT INTO cart (id, item_id, user_id, size, qty) values (null, ?, ?, ?, ?)';
    connection.query(query, [item_id, user_id, size, qty], (err, result) => {
        if (err) {
            res.status(500).json({ message: 'Error adding cart items', error: err });
            return;
        }
        res.status(200).json({ message: 'cart item added successfully', userId: result.email });
    });
});

app.post('/api/order', (req, res) => {
    const { email, total, date } = req.body;
    const query = 'INSERT INTO order_tb (id, email, total, order_date) values (null, ?, ?, ?)';
    connection.query(query, [email, total, date], (err, result) => {
        if (err) {
            res.status(500).json({ message: 'Error adding favourite items', error: err });
            return;
        }
        res.status(200).json({ message: 'Order placed successfully', userId: result.email });
    });
});




// Endpoint to get products by subcategory within a category
app.get('/api/products/:category/:subcategory', (req, res) => {
    let { category, subcategory } = req.params;

    // Convert category and subcategory to the case used in the database.
    category = category.charAt(0).toUpperCase() + category.slice(1).toLowerCase();
    subcategory = subcategory.toLowerCase();

    const sql = 'SELECT * FROM products WHERE category = ? AND subCategory = ?';

    connection.query(sql, [category, subcategory], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error', details: error });
        }
        res.json(results);
    });
});

// Endpoint to search products by name
app.get('/api/search', (req, res) => {
    const { query } = req.query;
    const sql = 'SELECT * FROM Products WHERE productName LIKE ?';
    // Adding '%' before and after the query to perform a partial match
    const searchTerm = '%' + query + '%';
    connection.query(sql, [searchTerm], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        res.json(results);
    });
});

app.get('/api/sortByPrice', (req, res) => {
    const { order } = req.query;
    let sql = 'SELECT * FROM Products ORDER BY price';
    if (order === 'desc') {
        sql += ' DESC'; // Sort in descending order
    }
    connection.query(sql, (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        }
        res.json(results);
    });
});

// Endpoint to get a product by its ID
app.get('/api/productss/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'SELECT * FROM Products WHERE id = ?';
    connection.query(sql, [id], (error, results) => {
        if (error) {
            return res.status(500).json({ error: 'Database error' });
        } else {
            res.json(results[0]); // Assuming you want to return a single product object
        }
    });
});

//get cart
app.get('/api/cart/:email', (req, res) => {
    const email = req.params.email;
    const query = `SELECT cart.id,products.productName,products.price,products.image,cart.size,cart.qty FROM cart JOIN products ON cart.item_id = products.id WHERE user_id = '${email}'`;

    connection.query(query, (error, results, fields) => {
        if (error) {
            res.status(500).json({ error: 'Internal Server Error' });
        } else {
            if (results.length === 0) {
                res.status(404).json({ error: 'Cart Item not found' });
            } else {
                res.json(results);
            }
        }
    });
})

//delete cart item
app.post('/api/cart/:id', (req, res) => {
    const id = req.params.id;
    const query = `delete from cart where id = '${id}'`;

    connection.query(query, (error, results, fields) => {
        if (error) {
            res.status(500).json({ error: 'Internal Server Error' });
            return;
        }
        res.status(200).json({ message: 'Item removed successfully'});
    });
})

// delete cart data
app.post('/api/cart/delete/:email', (req, res) => {
    const email = req.params.email;
    const query = `delete from cart where user_id = '${email}'`;

    connection.query(query, (err, result) => {
        if (err) {
            res.status(500).json({ message: 'Error deleting cart items', error: err });
            return;
        }
        res.status(200).json({ message: 'Cart Deleted successfully'});
    });
})

// Insert into Cart
app.post('/api/cart', (req, res) => {
    const { item_id, user_id, size, qty } = req.body;
    const query = 'INSERT INTO cart (id, item_id, user_id, size, qty) values (null, ?, ?, ?, ?)';
    connection.query(query, [item_id, user_id, size, qty], (err, result) => {
        if (err) {
            res.status(500).json({ message: 'Error adding cart items', error: err });
            return;
        }
        res.status(200).json({ message: 'cart item added successfully', userId: result.email });
    });
});

const PORT = process.env.PORT || 3030;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});