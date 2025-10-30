// Cargar los módulos para poderlos utilizar
const express = require("express");
const path = require("node:path");
const fs = require("node:fs");
const crypto = require("node:crypto");
const methodOverride = require("method-override");
const db = require("./db"); // la conexión a la base de datos de mysql que esta en src/db.js


// Creo servidor
const app = express();

// Configuro el servidor
process.loadEnvFile();
const PORT = process.env.PORT;
app.set("views", "./views");
app.set("view engine", "ejs");
app.use(express.static(path.join(__dirname, "../public")));

// Middlewares
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Función para obtener todos los productos de la base de datos
function obtenerProductos(respuesta) {
  db.query('SELECT * FROM sweets', (err, resultados) => {
    if (err) {
      respuesta(err, null);
    } else {
      respuesta(null, resultados);
    }
  });
}

function crearMenu(datos, idioma) {
  let tiposProductos = [];
  let menu = "<ul>";

  if (idioma === "cat") {
  datos.forEach((producto) => {
    if (!tiposProductos.includes(producto.menu_name_cat)) {
      tiposProductos.push(producto.menu_name_cat);
    }
  });
} else {
  datos.forEach((producto) => {
    if (!tiposProductos.includes(producto.menu_name_esp)) {
      tiposProductos.push(producto.menu_name_esp);
    }
  });
}

  tiposProductos.forEach((tipo) => {
    menu += `<li><a href="/${tipo.toLocaleLowerCase()}">${tipo}</a></li>`;
  });
  menu += "</ul>";
  return menu
}


// Ruta en catalan
app.get("/", (req, res) => {
  obtenerProductos((error, productos) => {
    if (error) {
      console.error('Error obteniendo productos:', error);
      return;
    }
    const menu = crearMenu(productos, "cat");
    res.render("index", { title: "Umm...!", menu, productes: productos, lang: "ESP" });
  });
});

// Ruta raíz
app.get("/esp", (req, res) => {
  obtenerProductos((error, productos) => {
    if (error) {
      console.error('Error obteniendo productos:', error);
      return;
    }
    const menu = crearMenu(productos, "esp");
    res.render("inicio", { title: "Umm...!", menu, productes: productos });
  });
});

app.get("/admin", (req, res) => {
  obtenerProductos((error, productos) => {
    if (error) {
      console.error('Error obteniendo productos:', error);
      return;
    }
    const menu = crearMenu(productos, "cat");
    res.render("admin", { title: "Gestió", menu, productes: productos });
  });
});


app.post("/insert", (req, res) => {
  const datos = req.body;
  
  // Genero ID único con randomUUID
  const nuevoId = crypto.randomUUID();
  
  // Insertar un nuevo producto
  const consultaInsertar = `INSERT INTO sweets (id, menu_name_cat, name_cat, descripcio_cat, menu_name_esp, name_esp, descripcio_esp, preu, img) 
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  
  const valores = [
    nuevoId,
    datos.menu_name_cat,
    datos.name_cat,
    datos.descripcio_cat,
    datos.menu_name_esp,
    datos.name_esp,
    datos.descripcio_esp,
    datos.preu,
    datos.img
  ];
  
  db.query(consultaInsertar, valores, (error, resultados) => {
    if (error) {
      console.error('Error insertando producto:', error);
      return;
    }
    console.log('Producto insertado con ID:', nuevoId);
    res.redirect("/admin");
  });
});

// Ruta para errores 404
app.use((req, res) => {
  obtenerProductos((error, productos) => {
    if (error) {
      console.error('Error en 404:', error);
      res.render("404", { title: "Error 404", menu: "<ul></ul>" });
      return;
    }
    const menu = crearMenu(productos, "cat");
    res.render("404", { title: "Error 404", menu });
  });
});

app.listen(PORT, () => {
  console.log(`Servidor arrancado en http://localhost:${PORT}`);
});


