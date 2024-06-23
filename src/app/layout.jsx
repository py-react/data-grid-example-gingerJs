import React from 'react'
import { Outlet } from 'react-router-dom'
import Link from "src/libs/Link"

function Layout() {
  return (
    <div className='p-0' style={{ minHeight: "100vh", width: '100vw' }}>
      <div className='flex space-x-2 items-center justify-center p-4'>
        <Link className="hover:underline" to="/mui-data-grid">MUI data-grid Example</Link>
        <Link className="hover:underline" to="/shadcn-data-table">Shadcn UI data table</Link>
      </div>
      <Outlet />
    </div>
  )
}

export default Layout