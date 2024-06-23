import * as React from 'react';
import { DataGrid} from '@mui/x-data-grid';

export default function MUITable({rows,columns}) {
  return (
    <div>
      <DataGrid rows={rows} columns={columns} />
    </div>
  );
}