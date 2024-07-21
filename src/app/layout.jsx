import React from 'react'
import { Outlet } from 'react-router-dom'
import Link from "src/libs/Link"
import { ServerStyleSheet } from "styled-components"


export const getAppContext = (ctx)=>{
  const sheet = new ServerStyleSheet()
  ctx.renderApp=()=>({
    getStyles:(App)=> sheet.collectStyles(App),
    styles:()=>sheet.getStyleTags(),
    finally: sheet.seal
  })
  return ctx
}


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