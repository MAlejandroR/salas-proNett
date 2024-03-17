import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import {Head} from '@inertiajs/react';
import {useState, useEffect} from "react";

export default function Dashboard({user, salas}) {
    console.log("Usuario " + user.name);
    console.log("Salas " + salas);
    const [salasFavoritas, setSalasFavoritas] = useState([]);
    useEffect(() => {

            setSalasFavoritas(salas)

    }, [salas]);
    console.log("Salas:  " + salasFavoritas);

    const handleDelFavorito = (salaId) => {
        console.log("sala Id" + salaId)

        const id = user.id;
        const ruta = `/delfavoritos/${id}/${salaId}`;
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
                //Acutalizamos el listado de nuevas salas
                const nuevasSalas = salasFavoritas.filter(sala => sala.id !== salaId)
                setSalasFavoritas(nuevasSalas)

            })
            .catch((error) => {
                console.error('Error:', error);
            });
    }
    return (


        <AuthenticatedLayout
            header={<h2 className="dash0">Salas guardadas</h2>}
            user={user}
        >
            <Head title="Dashboard"/>

            <div className="dash1">
                <div className="dash2">
                    <div className="dash3">
                        <div className="dash4">¡Hola {user.name}!</div>
                        {/* Lista de salas */}
                        <h1>Listado de salas favoritas de {user.name}</h1>
                        <table>
                            <tbody>
                            {salasFavoritas
                                .sort((a, b) => a.sala.localeCompare(b.sala))
                                .map((sala, index) => (
                                    <tr key={index}
                                        className="hover-effect">
                                        <td style={{cursor: 'pointer'}}>{sala.sala}</td>
                                        <td>{sala.provincia}</td>
                                        <td>{sala.municipio}</td>
                                        <td>{sala.genero}</td>
                                        <td>{sala.aforo}</td>
                                        <td>
                                            <button onClick={() => handleDelFavorito(sala.id)}>
                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                                     strokeWidth={1.5} stroke="red" className="w-10 h-10">
                                                    <path strokeLinecap="round" strokeLinejoin="round"
                                                          d="m20.25 7.5-.625 10.632a2.25 2.25 0 0 1-2.247 2.118H6.622a2.25 2.25 0 0 1-2.247-2.118L3.75 7.5m6 4.125 2.25 2.25m0 0 2.25 2.25M12 13.875l2.25-2.25M12 13.875l-2.25 2.25M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z"/>
                                                </svg>
                                            </button>

                                        </td>

                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
