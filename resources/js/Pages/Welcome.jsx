import React, {useState, useEffect} from 'react';
import {Link, Head} from '@inertiajs/react';

export default function Welcome({user, laravelVersion, phpVersion, salas, salasFavoritas}) {

    const FavoritoSvg = () => (
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="green" width="24px" height="24px">
            <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
        </svg>
    )
    const NoFavoritoSvg = () => (
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="red" width="24px" height="24px">
            <path
                d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
        </svg>

    )
    //Establecemos un array, pasa saber si cada sala es o no favorita
    const [favoritos, setFavoritos] = useState({});
    useEffect(() => {
        const favoritosIniciales = {};
        salasFavoritas.forEach(sala => {
            favoritosIniciales[sala.id] = true; // Marca cada sala como favorita
        });
        setFavoritos(favoritosIniciales);
    }, [salas]);

    const [salasData, setSalasData] = useState(salas || []);
    const [salaSeleccionada, setSalaSeleccionada] = useState('');
    const [provinciaSeleccionada, setProvinciaSeleccionada] = useState('');
    const [municipioSeleccionado, setMunicipioSeleccionado] = useState('');
    const [generoSeleccionado, setGeneroSeleccionado] = useState('');
    const [aforoSeleccionado, setAforoSeleccionado] = useState('');
    const [provinciaBloqueada, setProvinciaBloqueada] = useState(false);
    const [municipioBloqueado, setMunicipioBloqueado] = useState(false);
    const [generoBloqueado, setGeneroBloqueado] = useState(false);
    const [aforoBloqueado, setAforoBloqueado] = useState(false);
    const [mostrarTabla, setMostrarTabla] = useState(false);
    const handleFavoritoChange = (event, salaId) => {
        event.stopPropagation();
        console.log("sala Id" + salaId)
        // console.log(favoritos[salaId])
        // Convertimos el estado actual a booleano
        const esFavoritoActual = favoritos[salaId];

        // console.log(esFavoritoActual);

        const esFavoritoNuevo = !esFavoritoActual; // Convertimos el estado actual a booleano
        // console.log(esFavoritoNuevo);
        const nuevosFavoritos = {...favoritos, [salaId]: esFavoritoNuevo}; // Actualizamos el estado de favorito para esta sala
        setFavoritos(nuevosFavoritos);
        // console.log(nuevosFavoritos);

        const isChecked = event.target.checked; //Si está o no checkeado

        const id = user.id;
        let ruta = esFavoritoNuevo ? "/addfavoritos" : "/delfavoritos";
        ruta += `/${id}/${salaId}`;
        fetch(ruta, {
            method: "GET",
            headers: {
                'X-Requested-With': 'XMLHttpRequest', // Necesario si estás usando Laravel para evitar el Middleware de protección CSRF en solicitudes GET
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Success:', data);
                // Aquí puedes manejar la respuesta del servidor, como actualizar el estado para reflejar el cambio
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    }
    const handleSalaClick = (id) => {
        window.open(`/salas/${id}`, '_blank');
    };


    const handleSubmit = (event) => {
        event.preventDefault();

        const resultados = salas.filter(sala => {
            if (salaSeleccionada && sala.id !== parseInt(salaSeleccionada)) {
                return false;
            }

            if (provinciaSeleccionada && sala.provincia !== provinciaSeleccionada) {
                return false;
            }

            if (municipioSeleccionado && sala.municipio !== municipioSeleccionado) {
                return false;
            }

            if (generoSeleccionado && sala.genero !== generoSeleccionado) {
                return false;
            }

            if (aforoSeleccionado && sala.aforo !== aforoSeleccionado) {
                return false;
            }

            return true;
        });

        setSalasData(resultados);
        setMostrarTabla(resultados.length > 0);
    };

    const handleSalaSelection = (event) => {
        const salaSeleccionada = event.target.value;
        setSalaSeleccionada(salaSeleccionada);
        /*  setProvinciaSeleccionada('');
         setMunicipioSeleccionado('');
         setGeneroSeleccionado('');
         setAforoSeleccionado('');
         setProvinciaBloqueada(true);
         setMunicipioBloqueado(true);
         setGeneroBloqueado(true);
         setAforoBloqueado(true); */
    };

    const handleProvinciaSelection = (event) => {
        const provinciaSeleccionada = event.target.value;
        setProvinciaSeleccionada(provinciaSeleccionada);
        setMunicipioBloqueado(false);
    };

    const handleMunicipioSelection = (event) => {
        const municipioSeleccionado = event.target.value;
        setMunicipioSeleccionado(municipioSeleccionado);
        setProvinciaBloqueada(true);
    };

    const handleGeneroSelection = (event) => {
        const generoSeleccionado = event.target.value;
        setGeneroSeleccionado(generoSeleccionado);
    };

    const handleAforoSelection = (event) => {
        const aforoSeleccionado = event.target.value;
        setAforoSeleccionado(aforoSeleccionado);
    };

    const resetForm = () => {
        setSalaSeleccionada('');
        setProvinciaSeleccionada('');
        setMunicipioSeleccionado('');
        setGeneroSeleccionado('');
        setAforoSeleccionado('');
        setProvinciaBloqueada(false);
        setMunicipioBloqueado(false);
        setGeneroBloqueado(false);
        setAforoBloqueado(false);
    };

    return (
        <>
            <Head title="Welcome"/>

            <div className="AudioPlay">
                <a href="audio" target='_blank'>
                    <button type="button" className="btn_audio">Ir al reproductor de audio</button>
                </a>
            </div>

            <div className="barrafija">
                <div className="topbar-left">
                    <a href="">
                        <h2>Salas de Concierto</h2>
                    </a>
                </div>
                <div>
                    <form method="get" action="" id="formularioBusquedaTopbar">
                        <div className="search-bar">
                            <input type="text" id="busqueda" name="busqueda" placeholder="¿Qué quieres buscar?"
                                   className="buscartext"/>
                            <button type="submit" className="enviar-btn" id="enviarBtn">Buscar</button>
                        </div>
                    </form>
                </div>
                <div>
                    <a href="audio" target='_blank'>
                        <button type="button" className="btn_audio">Reproductor</button>
                    </a>
                </div>
                <div className="panel0">
                    {user ? (
                        <Link
                            href={route('dashboard')}
                            className="panel"
                        >
                            Panel
                        </Link>
                    ) : (
                        <>
                            <Link
                                href={route('login')}
                                className="panel"
                            >
                                Acceso
                            </Link>

                            {/* <Link
                                href={route('register')}
                                className="panel"
                            >
                                Registrarse
                            </Link> */}
                        </>
                    )}
                </div>
            </div>


            <div className="container">
                <h1>Salas de concierto</h1>

                <form
                    id="formularioBusqueda"
                    onSubmit={handleSubmit}
                >
                    {/* <input
                        type="hidden"
                        id="sala"
                        name="sala"
                        value=''
                    /> */}
                    <label htmlFor="sala">
                        Sala:
                    </label>
                    <select
                        id="sala"
                        name="sala"
                        onChange={handleSalaSelection}
                        value={salaSeleccionada}
                    >
                        <option value="">
                            Seleccionar Sala
                        </option>
                        {salas
                            .filter(sala => {
                                if (provinciaSeleccionada && municipioSeleccionado) {
                                    return sala.provincia === provinciaSeleccionada && sala.municipio === municipioSeleccionado;
                                } else if (provinciaSeleccionada && !municipioSeleccionado) {
                                    return sala.provincia === provinciaSeleccionada;
                                } else {
                                    return true;
                                }
                            })
                            .filter(sala => {
                                if (generoSeleccionado && aforoSeleccionado) {
                                    return sala.genero === generoSeleccionado && sala.aforo === aforoSeleccionado;
                                } else if (generoSeleccionado && !aforoSeleccionado) {
                                    return sala.genero === generoSeleccionado;
                                } else if (!generoSeleccionado && aforoSeleccionado) {
                                    return sala.aforo === aforoSeleccionado;
                                } else {
                                    return true;
                                }
                            })
                            .sort((a, b) => a.sala.localeCompare(b.sala))
                            .map((sala, index) => (
                                <option key={index} value={sala.id}>
                                    {sala.sala}
                                </option>
                            ))
                        }
                    </select>
                    {/* <input
                        type="hidden"
                        id="provincia"
                        name="provincia"
                        value=''
                    /> */}
                    <label htmlFor="provincia">
                        Provincia:
                    </label>
                    <select
                        id="provincia"
                        name="provincia"
                        onChange={handleProvinciaSelection}
                        value={provinciaSeleccionada}
                        disabled={!!salaSeleccionada || !!municipioSeleccionado}
                    >
                        <option value="">
                            Seleccionar Provincia
                        </option>
                        {[...new Set(
                            salas
                                .filter(sala => {
                                    if (generoSeleccionado && aforoSeleccionado) {
                                        return sala.genero === generoSeleccionado && sala.aforo === aforoSeleccionado;
                                    } else if (generoSeleccionado && !aforoSeleccionado) {
                                        return sala.genero === generoSeleccionado;
                                    } else if (!generoSeleccionado && aforoSeleccionado) {
                                        return sala.aforo === aforoSeleccionado;
                                    } else {
                                        return true;
                                    }
                                })
                                .map(sala => sala.provincia)
                        )]
                            .sort((a, b) => a.localeCompare(b))
                            .map((provincia, index) => (
                                <option key={index} value={provincia}>
                                    {provincia}
                                </option>
                            ))}
                    </select>

                    {/*   <input
                        type="hidden"
                        id="municipio"
                        name="municipio"
                        value=''
                    /> */}
                    <label htmlFor="municipio">
                        Municipio:
                    </label>
                    <select
                        id="municipio"
                        name="municipio"
                        onChange={handleMunicipioSelection}
                        value={municipioSeleccionado}
                        disabled={!provinciaSeleccionada || !!salaSeleccionada}
                    >
                        <option value="">
                            Seleccionar Municipio
                        </option>
                        {[...new Set(
                            salas
                                .filter(sala => {
                                    if (generoSeleccionado && aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.genero === generoSeleccionado && sala.aforo === aforoSeleccionado;
                                    } else if (generoSeleccionado && !aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.genero === generoSeleccionado;
                                    } else if (!generoSeleccionado && aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.aforo === aforoSeleccionado;
                                    } else {
                                        return sala.provincia === provinciaSeleccionada;
                                    }
                                })
                                .map(sala => sala.municipio)
                        )]
                            .sort((a, b) => a.localeCompare(b))
                            .map((municipio, index) => (
                                <option key={index} value={municipio}>
                                    {municipio}
                                </option>
                            ))}
                    </select>

                    {/*  <input
                        type="hidden"
                        id="genero"
                        name="genero"
                        value=''
                    /> */}
                    <label htmlFor="genero">
                        Género:
                    </label>
                    <select
                        id="genero"
                        name="genero"
                        onChange={handleGeneroSelection}
                        value={generoSeleccionado}
                        disabled={!!salaSeleccionada}
                    >
                        <option value="">
                            Seleccionar Género
                        </option>
                        {[...new Set(
                            salas
                                .filter(sala => {
                                    if (provinciaSeleccionada && municipioSeleccionado && aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.municipio === municipioSeleccionado && sala.aforo === aforoSeleccionado;
                                    } else if (provinciaSeleccionada && municipioSeleccionado && !aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.municipio === municipioSeleccionado;
                                    } else if (provinciaSeleccionada && !municipioSeleccionado && aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.aforo === aforoSeleccionado;
                                    } else if (!provinciaSeleccionada && municipioSeleccionado && aforoSeleccionado) {
                                        return sala.municipio === municipioSeleccionado && sala.aforo === aforoSeleccionado;
                                    } else if (provinciaSeleccionada && !municipioSeleccionado && !aforoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada;
                                    } else if (!provinciaSeleccionada && municipioSeleccionado && !aforoSeleccionado) {
                                        return sala.municipio === municipioSeleccionado;
                                    } else if (!provinciaSeleccionada && !municipioSeleccionado && aforoSeleccionado) {
                                        return sala.aforo === aforoSeleccionado;
                                    } else {
                                        return true;
                                    }
                                })
                                .map(sala => sala.genero)
                        )]
                            .sort((a, b) => a.localeCompare(b))
                            .map((genero, index) => (
                                <option key={index} value={genero}>
                                    {genero}
                                </option>
                            ))}
                    </select>

                    {/*  <input
                        type="hidden"
                        id="aforo"
                        name="aforo"
                        value=''
                    /> */}
                    <label htmlFor="genero">
                        Aforo:
                    </label>
                    <select
                        id="aforo"
                        name="aforo"
                        onChange={handleAforoSelection}
                        value={aforoSeleccionado}
                        disabled={!!salaSeleccionada}
                    >
                        <option value="">
                            Seleccionar Aforo
                        </option>
                        {[...new Set(
                            salas
                                .filter(sala => {
                                    if (provinciaSeleccionada && municipioSeleccionado && generoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.municipio === municipioSeleccionado && sala.genero === generoSeleccionado;
                                    } else if (provinciaSeleccionada && municipioSeleccionado && !generoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.municipio === municipioSeleccionado;
                                    } else if (provinciaSeleccionada && !municipioSeleccionado && generoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada && sala.genero === generoSeleccionado;
                                    } else if (!provinciaSeleccionada && municipioSeleccionado && generoSeleccionado) {
                                        return sala.municipio === municipioSeleccionado && sala.genero === generoSeleccionado;
                                    } else if (provinciaSeleccionada && !municipioSeleccionado && !generoSeleccionado) {
                                        return sala.provincia === provinciaSeleccionada;
                                    } else if (!provinciaSeleccionada && municipioSeleccionado && !generoSeleccionado) {
                                        return sala.municipio === municipioSeleccionado;
                                    } else if (!provinciaSeleccionada && !municipioSeleccionado && generoSeleccionado) {
                                        return sala.genero === generoSeleccionado;
                                    } else {
                                        return true;
                                    }
                                })
                                .map(sala => sala.aforo)
                        )]
                            .filter(aforo => aforo !== null)
                            .map(aforo => parseInt(aforo))
                            .filter((aforo, index, self) => self.indexOf(aforo) === index)
                            .sort((a, b) => a - b)
                            .map((aforo, index) => (
                                <option key={index} value={aforo}>
                                    {aforo}
                                </option>
                            ))}
                    </select>
                    <div className="btn-box">
                        <button type="button" onClick={() => window.location.reload()} className="reset-btn">
                            Restablecer
                        </button>
                        <button type="submit" className="busca-btn">
                            Buscar
                        </button>
                    </div>
                </form>

                {mostrarTabla && ( // Mostrar la tabla solo si mostrarTabla es true
                    <div className="tabla">
                        <h2>Resultados de la búsqueda:</h2>
                        <table>
                            <thead>
                            <tr>
                                <th>Sala</th>
                                <th>Provincia</th>
                                <th>Municipio</th>
                                <th>Géneros</th>
                                <th>Aforo</th>
                                {user && (<th>Favorito</th>)}
                            </tr>
                            </thead>

                            <tbody>
                            {salasData
                                .sort((a, b) => a.sala.localeCompare(b.sala))
                                .map((sala, index) => (
                                    <tr key={index} onClick={() => handleSalaClick(sala.id)}
                                        className="hover-effect">
                                        <td style={{cursor: 'pointer'}}>{sala.sala}</td>
                                        <td>{sala.provincia}</td>
                                        <td>{sala.municipio}</td>
                                        <td>{sala.genero}</td>
                                        <td>{sala.aforo}</td>
                                        {user && (
                                            <td>
                                                <button onClick={(e) => handleFavoritoChange(e, sala.id)}>
                                                    {favoritos[sala.id] ? <FavoritoSvg/> : <NoFavoritoSvg/>}
                                                </button>

                                            </td>
                                        )}
                                    </tr>
                                ))}
                            </tbody>

                            {/* <tbody>

                            <tr >
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                        </tbody> */}
                        </table>
                    </div>
                )}

            </div>
        </>
    );
}
