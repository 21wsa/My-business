const express = require('express');
const cors = require('cors');
const path = require('path');
const multer = require('multer');

const app = express();

// Set up file storage
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, 'uploads'));
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname));
    }
});
const upload = multer({ storage: storage });

// Set up Express
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

let products = []; // Store products in memory

// Login route
app.post('/login', (req, res) => {
    const { password } = req.body;
    if (password === 'R7v5T2m1W3') { // Check password
        res.json({ success: true });
    } else {
        res.status(401).json({ success: false });
    }
});

// Add product route
app.post('/admin/products', upload.single('image'), (req, res) => {
    const { name, description } = req.body;
    const image = req.file ? req.file.filename : null;

    const newProduct = { id: Date.now().toString(), name, description, image };
    products.push(newProduct);

    res.json(newProduct);
});

// Get products route
app.get('/products', (req, res) => {
    res.json(products);
});

// Update product route
app.put('/admin/products/:id', upload.single('image'), (req, res) => {
    const { id } = req.params;
    const { name, description } = req.body;
    const image = req.file ? req.file.filename : null;

    const productIndex = products.findIndex(product => product.id === id);
    if (productIndex !== -1) {
        // Update product data
        products[productIndex] = { 
            id, 
            name: name || products[productIndex].name, 
            description: description || products[productIndex].description, 
            image: image || products[productIndex].image 
        };
        res.json(products[productIndex]);
    } else {
        res.status(404).json({ error: 'Product not found' });
    }
});

app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
