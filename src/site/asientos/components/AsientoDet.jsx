import { lastDayOfDecade, lastDayOfISOWeek } from "date-fns/esm"
import { AsientosDetItem } from "./AsientosDetItem"

export const AsientoDet = () => {

    const lineas = [
        {
            "id": "1",
            "cuenta": "1-01-0001-0001",
            "descripcion": "activo fijo",
            "observaciones": "observaciones",
            "tDocumento": "DEP",
            "nDocumentor": "564654",
            "tercero": "",
            "debe": "15,000.00",
            "haber": "0.00",
        },
        {
            "id": "2",
            "cuenta": "1-01-0001-0001",
            "descripcion": "activo fijo",
            "observaciones": "observaciones",
            "tDocumento": "DEP",
            "nDocumentor": "564654",
            "tercero": "",
            "debe": "0.00",
            "haber": "15,000.00",
        },
    ]

    return (
        <>
            <table id="tableView" className="table table-striped table-light table-sm" style={{ "width": "100%" }}>
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Cuenta</th>
                        <th>Descripción</th>
                        <th>Observaciones</th>
                        <th>T Documento</th>
                        <th>N Documento</th>
                        <th>Tercero</th>
                        <th>Debe</th>
                        <th>Haber</th>
                    </tr>
                </thead>
                <tbody>

                {
                        lineas.map((l) => (
                            <AsientosDetItem
                                key={l.id}
                                lineaAsiento={l}
                            />
                        ))
                    }

                </tbody>
            </table>
        </>
    )
}
