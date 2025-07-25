/**
 * Receipt Manager API
 *
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */
/* tslint:disable:no-unused-variable member-ordering */

import { Inject, Injectable, Optional }                      from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams,
         HttpResponse, HttpEvent, HttpParameterCodec, HttpContext 
        }       from '@angular/common/http';
import { CustomHttpParameterCodec }                          from '../encoder';
import { Observable }                                        from 'rxjs';

// @ts-ignore
import { HTTPValidationError } from '../model/hTTPValidationError';
// @ts-ignore
import { PaginatedResponseReceiptListResponse } from '../model/paginatedResponseReceiptListResponse';
// @ts-ignore
import { ReceiptProcessingResponse } from '../model/receiptProcessingResponse';
// @ts-ignore
import { ReceiptResponse } from '../model/receiptResponse';
// @ts-ignore
import { ReceiptUpdate } from '../model/receiptUpdate';

// @ts-ignore
import { BASE_PATH, COLLECTION_FORMATS }                     from '../variables';
import { Configuration }                                     from '../configuration';
import { BaseService } from '../api.base.service';



@Injectable({
  providedIn: 'root'
})
export class ReceiptsService extends BaseService {

    constructor(protected httpClient: HttpClient, @Optional() @Inject(BASE_PATH) basePath: string|string[], @Optional() configuration?: Configuration) {
        super(basePath, configuration);
    }

    /**
     * Get Receipt By Id
     * Get a specific receipt by ID
     * @param receiptId 
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public getReceiptByIdReceiptsReceiptIdGet(receiptId: string, observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<ReceiptResponse>;
    public getReceiptByIdReceiptsReceiptIdGet(receiptId: string, observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<ReceiptResponse>>;
    public getReceiptByIdReceiptsReceiptIdGet(receiptId: string, observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<ReceiptResponse>>;
    public getReceiptByIdReceiptsReceiptIdGet(receiptId: string, observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {
        if (receiptId === null || receiptId === undefined) {
            throw new Error('Required parameter receiptId was null or undefined when calling getReceiptByIdReceiptsReceiptIdGet.');
        }

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;


        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/${this.configuration.encodeParam({name: "receiptId", value: receiptId, in: "path", style: "simple", explode: false, dataType: "string", dataFormat: "uuid"})}`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<ReceiptResponse>('get', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

    /**
     * Get User Receipt Statistics
     * Get receipt statistics for the current user
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public getUserReceiptStatisticsReceiptsStatisticsGet(observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any>;
    public getUserReceiptStatisticsReceiptsStatisticsGet(observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<any>>;
    public getUserReceiptStatisticsReceiptsStatisticsGet(observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<any>>;
    public getUserReceiptStatisticsReceiptsStatisticsGet(observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;


        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/statistics/`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<any>('get', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

    /**
     * List User Receipts
     * Get all receipts for the current user with pagination
     * @param limit 
     * @param offset 
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public listUserReceiptsReceiptsGet(limit?: number, offset?: number, observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<PaginatedResponseReceiptListResponse>;
    public listUserReceiptsReceiptsGet(limit?: number, offset?: number, observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<PaginatedResponseReceiptListResponse>>;
    public listUserReceiptsReceiptsGet(limit?: number, offset?: number, observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<PaginatedResponseReceiptListResponse>>;
    public listUserReceiptsReceiptsGet(limit?: number, offset?: number, observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {

        let localVarQueryParameters = new HttpParams({encoder: this.encoder});
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>limit, 'limit');
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>offset, 'offset');

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;


        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<PaginatedResponseReceiptListResponse>('get', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                params: localVarQueryParameters,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

    /**
     * Process Receipt Image
     * Upload a receipt image, store it in Cloudinary, and start processing with Gemini LLM
     * @param file 
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public processReceiptImageReceiptsProcessPost(file: Blob, observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<ReceiptProcessingResponse>;
    public processReceiptImageReceiptsProcessPost(file: Blob, observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<ReceiptProcessingResponse>>;
    public processReceiptImageReceiptsProcessPost(file: Blob, observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<ReceiptProcessingResponse>>;
    public processReceiptImageReceiptsProcessPost(file: Blob, observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {
        if (file === null || file === undefined) {
            throw new Error('Required parameter file was null or undefined when calling processReceiptImageReceiptsProcessPost.');
        }

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;

        // to determine the Content-Type header
        const consumes: string[] = [
            'multipart/form-data'
        ];

        const canConsumeForm = this.canConsumeForm(consumes);

        let localVarFormParams: { append(param: string, value: any): any; };
        let localVarUseForm = false;
        let localVarConvertFormParamsToString = false;
        // use FormData to transmit files using content-type "multipart/form-data"
        // see https://stackoverflow.com/questions/4007969/application-x-www-form-urlencoded-or-multipart-form-data
        localVarUseForm = canConsumeForm;
        if (localVarUseForm) {
            localVarFormParams = new FormData();
        } else {
            localVarFormParams = new HttpParams({encoder: this.encoder});
        }

        if (file !== undefined) {
            localVarFormParams = localVarFormParams.append('file', <any>file) as any || localVarFormParams;
        }

        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/process`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<ReceiptProcessingResponse>('post', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                body: localVarConvertFormParamsToString ? localVarFormParams.toString() : localVarFormParams,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

    /**
     * Search Receipts By Item Category
     * Search receipts by item category
     * @param category 
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet(category: string, observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<Array<ReceiptResponse>>;
    public searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet(category: string, observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<Array<ReceiptResponse>>>;
    public searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet(category: string, observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<Array<ReceiptResponse>>>;
    public searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet(category: string, observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {
        if (category === null || category === undefined) {
            throw new Error('Required parameter category was null or undefined when calling searchReceiptsByItemCategoryReceiptsSearchCategoryCategoryGet.');
        }

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;


        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/search/category/${this.configuration.encodeParam({name: "category", value: category, in: "path", style: "simple", explode: false, dataType: "string", dataFormat: undefined})}`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<Array<ReceiptResponse>>('get', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

    /**
     * Search User Receipts
     * Search receipts with filters
     * @param merchant 
     * @param minTotal 
     * @param maxTotal 
     * @param startDate 
     * @param endDate 
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public searchUserReceiptsReceiptsSearchGet(merchant?: string, minTotal?: number, maxTotal?: number, startDate?: string, endDate?: string, observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<Array<ReceiptResponse>>;
    public searchUserReceiptsReceiptsSearchGet(merchant?: string, minTotal?: number, maxTotal?: number, startDate?: string, endDate?: string, observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<Array<ReceiptResponse>>>;
    public searchUserReceiptsReceiptsSearchGet(merchant?: string, minTotal?: number, maxTotal?: number, startDate?: string, endDate?: string, observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<Array<ReceiptResponse>>>;
    public searchUserReceiptsReceiptsSearchGet(merchant?: string, minTotal?: number, maxTotal?: number, startDate?: string, endDate?: string, observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {

        let localVarQueryParameters = new HttpParams({encoder: this.encoder});
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>merchant, 'merchant');
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>minTotal, 'min_total');
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>maxTotal, 'max_total');
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>startDate, 'start_date');
        localVarQueryParameters = this.addToHttpParams(localVarQueryParameters,
          <any>endDate, 'end_date');

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;


        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/search/`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<Array<ReceiptResponse>>('get', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                params: localVarQueryParameters,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

    /**
     * Update Receipt By Id
     * Update a receipt
     * @param receiptId 
     * @param receiptUpdate 
     * @param observe set whether or not to return the data Observable as the body, response or events. defaults to returning the body.
     * @param reportProgress flag to report request and response progress.
     */
    public updateReceiptByIdReceiptsReceiptIdPut(receiptId: string, receiptUpdate: ReceiptUpdate, observe?: 'body', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<ReceiptResponse>;
    public updateReceiptByIdReceiptsReceiptIdPut(receiptId: string, receiptUpdate: ReceiptUpdate, observe?: 'response', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpResponse<ReceiptResponse>>;
    public updateReceiptByIdReceiptsReceiptIdPut(receiptId: string, receiptUpdate: ReceiptUpdate, observe?: 'events', reportProgress?: boolean, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<HttpEvent<ReceiptResponse>>;
    public updateReceiptByIdReceiptsReceiptIdPut(receiptId: string, receiptUpdate: ReceiptUpdate, observe: any = 'body', reportProgress: boolean = false, options?: {httpHeaderAccept?: 'application/json', context?: HttpContext, transferCache?: boolean}): Observable<any> {
        if (receiptId === null || receiptId === undefined) {
            throw new Error('Required parameter receiptId was null or undefined when calling updateReceiptByIdReceiptsReceiptIdPut.');
        }
        if (receiptUpdate === null || receiptUpdate === undefined) {
            throw new Error('Required parameter receiptUpdate was null or undefined when calling updateReceiptByIdReceiptsReceiptIdPut.');
        }

        let localVarHeaders = this.defaultHeaders;

        // authentication (HTTPBearer) required
        localVarHeaders = this.configuration.addCredentialToHeaders('HTTPBearer', 'Authorization', localVarHeaders, 'Bearer ');

        const localVarHttpHeaderAcceptSelected: string | undefined = options?.httpHeaderAccept ?? this.configuration.selectHeaderAccept([
            'application/json'
        ]);
        if (localVarHttpHeaderAcceptSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Accept', localVarHttpHeaderAcceptSelected);
        }

        const localVarHttpContext: HttpContext = options?.context ?? new HttpContext();

        const localVarTransferCache: boolean = options?.transferCache ?? true;


        // to determine the Content-Type header
        const consumes: string[] = [
            'application/json'
        ];
        const httpContentTypeSelected: string | undefined = this.configuration.selectHeaderContentType(consumes);
        if (httpContentTypeSelected !== undefined) {
            localVarHeaders = localVarHeaders.set('Content-Type', httpContentTypeSelected);
        }

        let responseType_: 'text' | 'json' | 'blob' = 'json';
        if (localVarHttpHeaderAcceptSelected) {
            if (localVarHttpHeaderAcceptSelected.startsWith('text')) {
                responseType_ = 'text';
            } else if (this.configuration.isJsonMime(localVarHttpHeaderAcceptSelected)) {
                responseType_ = 'json';
            } else {
                responseType_ = 'blob';
            }
        }

        let localVarPath = `/receipts/${this.configuration.encodeParam({name: "receiptId", value: receiptId, in: "path", style: "simple", explode: false, dataType: "string", dataFormat: "uuid"})}`;
        const { basePath, withCredentials } = this.configuration;
        return this.httpClient.request<ReceiptResponse>('put', `${basePath}${localVarPath}`,
            {
                context: localVarHttpContext,
                body: receiptUpdate,
                responseType: <any>responseType_,
                ...(withCredentials ? { withCredentials } : {}),
                headers: localVarHeaders,
                observe: observe,
                transferCache: localVarTransferCache,
                reportProgress: reportProgress
            }
        );
    }

}
