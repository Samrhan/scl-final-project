import {Request, Response} from "express";
import {Repository} from "typeorm";
import {ProductEntity} from "../../persistence/entities/product.entity";

export function deleteProductRouteFactory(productRepository : Repository<ProductEntity>){
    return async (req: Request, res: Response) => {

    }
}