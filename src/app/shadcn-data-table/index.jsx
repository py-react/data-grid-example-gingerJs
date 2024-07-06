import * as React from 'react';
import Table from '@/components/Table';

export default function ShadcnUItable({rows,columns}) {

  const [columnData] = React.useState((()=>{
    return columns?.map(item=>{
      return     {
        accessorKey: item.field,
        header: item.headerName,
        cell: ({ row }) => (
          <div className="capitalize">{row.getValue(item.field)}</div>
        ),
      }
    }) || []
  })())

  return (
    <div>
      <Table data={rows} columns={columnData}/>
    </div>
  );
}