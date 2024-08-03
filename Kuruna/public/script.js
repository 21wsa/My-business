const apiBaseURL = 'http://localhost:3000';

// Initialize the admin interface when the page loads
document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('main-content')) {
        showLoginForm();
    }
    if (document.getElementById('visitor-content')) {
        fetchProducts();
    }
});

// Login
async function login(password) {
    try {
        const response = await fetch(`${apiBaseURL}/login`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ password }),
        });

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const result = await response.json();
        return result.success;
    } catch (error) {
        console.error('Error during login:', error);
        return false;
    }
}

// Show login form
function showLoginForm() {
    const mainContent = document.getElementById('main-content');
    if (!mainContent) {
        console.error('Element with id "main-content" not found');
        return;
    }

    const loginHTML = `
        <div class="login-form">
            <h2>Login</h2>
            <form id="loginForm">
                <label for="password">Password:</label>
                <input type="password" id="password" required>
                <button type="submit">Login</button>
            </form>
        </div>
    `;
    mainContent.innerHTML = loginHTML;

    document.getElementById('loginForm').addEventListener('submit', async (event) => {
        event.preventDefault();
        const password = document.getElementById('password').value;
        const success = await login(password);
        if (success) {
            showAdminContent();
        } else {
            alert('Incorrect password');
        }
    });
}

// Show admin interface after login
function showAdminContent() {
    const adminHTML = `
        <div class="admin-content">
            <h2>Product Management</h2>
            <h3>Add Product</h3>
            <form id="addProductForm" enctype="multipart/form-data">
                <label for="name">Product Name:</label>
                <input type="text" id="name" required>
                <label for="description">Description:</label>
                <textarea id="description" required></textarea>
                <label for="image">Choose Image:</label>
                <input type="file" id="image" required>
                <button type="submit">Add</button>
            </form>
            <h3>Update Product</h3>
            <form id="updateProductForm" style="display:none;" enctype="multipart/form-data">
                <input type="hidden" id="updateProductId">
                <label for="updateName">Product Name:</label>
                <input type="text" id="updateName" required>
                <label for="updateDescription">Description:</label>
                <textarea id="updateDescription" required></textarea>
                <label for="updateImage">Choose Image:</label>
                <input type="file" id="updateImage">
                <button type="submit">Update</button>
            </form>
            <h3>Current Products</h3>
            <div id="product-list">
                <!-- Products will be displayed here -->
            </div>
        </div>
    `;
    document.getElementById('main-content').innerHTML = adminHTML;

    document.getElementById('addProductForm').addEventListener('submit', async (event) => {
        event.preventDefault();
        const name = document.getElementById('name').value;
        const description = document.getElementById('description').value;
        const imageFile = document.getElementById('image').files[0];
        const newProduct = await addProduct(name, description, imageFile);
        if (newProduct) {
            alert('Product added successfully');
            fetchProducts(); // Re-fetch products after adding a new product
        } else {
            alert('Error adding product');
        }
    });

    document.getElementById('updateProductForm').addEventListener('submit', async (event) => {
        event.preventDefault();
        const id = document.getElementById('updateProductId').value;
        const name = document.getElementById('updateName').value;
        const description = document.getElementById('updateDescription').value;
        const imageFile = document.getElementById('updateImage').files[0];
        const updatedProduct = await updateProduct(id, name, description, imageFile);
        if (updatedProduct) {
            alert('Product updated successfully');
            fetchProducts(); // Re-fetch products after updating a product
        } else {
            alert('Error updating product');
        }
    });

    fetchProducts(); // Fetch products when admin interface is shown
}

// Add a new product
async function addProduct(name, description, imageFile) {
    try {
        const formData = new FormData();
        formData.append('name', name);
        formData.append('description', description);
        formData.append('image', imageFile);

        const response = await fetch(`${apiBaseURL}/admin/products`, {
            method: 'POST',
            body: formData,
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Network response was not ok: ${response.statusText} - ${errorText}`);
        }

        const newProduct = await response.json();
        return newProduct;
    } catch (error) {
        console.error('Error adding product:', error);
        return null;
    }
}

// Update a product
async function updateProduct(id, name, description, imageFile) {
    try {
        const formData = new FormData();
        formData.append('name', name);
        formData.append('description', description);
        if (imageFile) {
            formData.append('image', imageFile);
        }

        const response = await fetch(`${apiBaseURL}/admin/products/${id}`, {
            method: 'PUT',
            body: formData,
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Network response was not ok: ${response.statusText} - ${errorText}`);
        }

        const updatedProduct = await response.json();
        return updatedProduct;
    } catch (error) {
        console.error('Error updating product:', error);
        return null;
    }
}

// Fetch product list from the server
async function fetchProducts() {
    try {
        const response = await fetch(`${apiBaseURL}/products`);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const products = await response.json();
        displayProducts(products);
    } catch (error) {
        console.error('Error fetching products:', error);
        const productList = document.getElementById('product-list');
        productList.innerHTML = '<p>Error fetching products</p>';
    }
}

// Display products in the interface
function displayProducts(products) {
    const productList = document.getElementById('product-list');
    if (products.length === 0) {
        productList.innerHTML = '<p>No products to display</p>';
        return;
    }

    const productHTML = products.map(product => `
        <div class="product">
            <h3>${product.name}</h3>
            <p>${product.description}</p>
            <img src="${apiBaseURL}/uploads/${product.image}" alt="${product.name}">
            <button onclick="editProduct('${product.id}', '${product.name}', '${product.description}', '${product.image}')">Update</button>
        </div>
    `).join('');
    productList.innerHTML = productHTML;
}

// Setup the update form
function editProduct(id, name, description, image) {
    document.getElementById('updateProductForm').style.display = 'block';
    document.getElementById('updateProductId').value = id;
    document.getElementById('updateName').value = name;
    document.getElementById('updateDescription').value = description;
    // We will not display the old image in the form, but this can be added if needed
}
