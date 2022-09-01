var express = require("express")
var mysql = require("mysql")
var app = express()

app.use(express.json())

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'citysport'
})


con.connect((err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('connexion établie');
    }
})


app.get('/', (req, res)=>{
    res.send('Hello');
})


app.get('/api/get', (req, res)=>{
    
    con.query('SELECT * FROM chaussures',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})


app.get('/api/get/:id', (req, res)=>{
    
    con.query('SELECT * FROM chaussures WHERE idxChaussure=?',[req.params.idxChaussure],(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})


app.post('/api/chaussures/post', (req, res)=>{
    const id_marque = req.body.id_marque;
    const couleur = req.body.couleur;
    const taille = req.body.taille;
    const prix = req.body.prix;

    
    con.query('INSERT INTO chaussures VALUES(NULL,?,?,?,?)',[id_marque,couleur,taille,prix],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})

app.post('/api/marques/post', (req, res)=>{
    const nom_de_la_marque = req.body.nom_de_la_marque;
    const logo = req.body.logo;

    
    con.query('INSERT INTO marques VALUES(NULL,?,?)',[nom_de_la_marque,logo],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})


app.listen(3003, (err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('on port 3003');
    }
})