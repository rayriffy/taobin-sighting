import { Feature } from './Feature'

export interface TaobinDetail {
  id: number
  name: string
  features: Feature[]
  imageUrl: string
  location: {
    locateGuide: string
    geo: {
      lat: number
      lon: number
    }
  }
}
