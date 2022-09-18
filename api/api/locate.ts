import { VercelApiHandler } from '@vercel/node'

import { sampleTaobinMachines } from '../constants/sampleTaobinMachines'

interface LocateRequest {
  lat: string
  lon: string
  latDelta: string
  lonDelta: string
}

const api: VercelApiHandler = async (req, res) => {
  const request = req.query as unknown as LocateRequest

  const transformedRequest = {
    lat: Number(request.lat),
    lon: Number(request.lon),
    latDelta: Number(request.latDelta),
    lonDelta: Number(request.lonDelta)
  }

  console.log(`(${transformedRequest.lat}, ${transformedRequest.lon}) [${transformedRequest.latDelta}, ${transformedRequest.lonDelta}]`)

  const filteredMachines = sampleTaobinMachines.filter(machine => {
    return (machine.location.geo.lat >= (transformedRequest.lat - transformedRequest.latDelta)) &&
      (machine.location.geo.lat <= (transformedRequest.lat + transformedRequest.latDelta)) &&
      (machine.location.geo.lon >= (transformedRequest.lon - transformedRequest.lonDelta)) &&
      (machine.location.geo.lon <= (transformedRequest.lon + transformedRequest.lonDelta))
  })

  console.log(filteredMachines.length)

  return res.send({
    message: 'ok',
    data: filteredMachines
  })
}

export default api
