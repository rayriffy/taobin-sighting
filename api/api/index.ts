import { VercelApiHandler } from '@vercel/node'

const api: VercelApiHandler = async (req, res) => {
  return res.send({
    message: 'ok'
  })
}

export default api
