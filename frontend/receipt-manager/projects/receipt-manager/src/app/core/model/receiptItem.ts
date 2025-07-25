/**
 * Receipt Manager API
 *
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


export interface ReceiptItem { 
    description: string;
    itemCode?: string | null;
    category?: string | null;
    unitPrice?: number | null;
    quantity: number;
    lineTotal: number;
    currency: string;
}

