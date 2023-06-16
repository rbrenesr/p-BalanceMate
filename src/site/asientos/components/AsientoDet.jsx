import { useAsientosStore } from "../hooks"
import { AsientosDetItemList } from "./"

export const AsientoDet = () => {
    const { asientosDetItems } = useAsientosStore();

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
                        asientosDetItems.map((l) => (
                            <AsientosDetItemList
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
