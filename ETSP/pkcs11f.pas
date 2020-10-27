{************************************************************************}
{                                                                        }
{       Borland Delphi Runtime Library                                   }
{       Pkcs11 interface unit                                             }
{                                                                        }
{ Portions created by Microsoft are                                      }
{ Copyright (C) 1995-1999 Microsoft Corporation.                         }
{ All Rights Reserved.                                                   }
{                                                                        }
{ Portions created by RSA Inc are                                        }
{ Copyright RSA Security Inc. PKCS #11 Cryptographic Token Interface     }
{                                                                        }
{ The original file is: pkcs11f.h, version 1.1.                          }
{ The original Pascal code is: pkcs11f.pas, released 18 May 2006.        }
{ The initial developer of the Pascal code is Danny Heijl                }
{ (danny.heijl@telenet.be).                                              }
{                                                                        }
{ Portions created by Danny Heijl are                                    }
{ Copyright (C) 2006 Danny Heijl.                                        }
{                                                                        }
{ Contributor(s): Danny Heijl                                            }
{                                                                        }
{       Obtained through:                                                }
{                                                                        }
{       Joint Endeavour of Delphi Innovators (Project JEDI)              }
{                                                                        }
{ You may retrieve the latest version of this file at the Project        }
{ JEDI home page, located at http://delphi-jedi.org                      }
{                                                                        }
{ The contents of this file are used with permission, subject to         }
{ the Mozilla Public License Version 1.1 (the "License"); you may        }
{ not use this file except in compliance with the License. You may       }
{ obtain a copy of the License at                                        }
{ http://www.mozilla.org/MPL/MPL-1.1.html                                }
{                                                                        }
{ Software distributed under the License is distributed on an            }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or         }
{ implied. See the License for the specific language governing           }
{ rights and limitations under the License.                              }
{                                                                        }
{************************************************************************}

{-------------------------------------------------------------------------------
   $Id: pkcs11f.pas,v 1.2 2006/08/09 07:55:20 DH Exp $
   Unit Name: pkcs11f
   Author:    Danny Heijl
   Date:      17-06-2003
   Created:   18-06-2003
   Purpose:   manual translation of pkcs11f.h from C to Pascal
   History:
     - Original: DH, 18-06-2003

     Original license: see RSA Security Inc license below
-------------------------------------------------------------------------------}
unit pkcs11f;

interface

uses Windows, pkcs11t;

{/* pkcs11f.h include file for PKCS #11. */}
{/* $Revision: 1.2 $ */}

{/* License to copy and use this software is granted provided that it is
  * identified as "RSA Security Inc. PKCS #11 Cryptographic Token Interface
  * (Cryptoki)" in all material mentioning or referencing this software.

  * License is also granted to make and use derivative works provided that
  * such works are identified as "derived from the RSA Security Inc. PKCS #11
  * Cryptographic Token Interface (Cryptoki)" in all material mentioning or
  * referencing the derived work.

  * RSA Security Inc. makes no representations concerning either the
  * merchantability of this software or the suitability of this software for
  * any particular purpose. It is provided "as is" without express or implied
  * warranty of any kind.
 */}

{/* This header file contains pretty much everything about all the */}
{/* Cryptoki function prototypes.  Because this information is */}
{/* used for more than just declaring function prototypes, the */}
{/* order of the functions appearing herein is important, and */}
{/* should not be altered. */}

{/* General-purpose */}

{/* C_Initialize initializes the Cryptoki library. */}
function C_Initialize(
  pInitArgs: CK_VOID_PTR {/* if this is not NULL_PTR, it gets cast to CK_C_INITIALIZE_ARGS_PTR and dereferenced */}
  ): CK_RV; cdecl;

{/* C_Finalize indicates that an application is done with the
  * Cryptoki library. */}
function C_Finalize(
  pReserved: CK_VOID_PTR                {/* reserved.  Should be NULL_PTR */}
  ): CK_RV; cdecl;

{/* C_GetInfo returns general information about Cryptoki. */}
function C_GetInfo(
  pInfo: CK_INFO_PTR                    {/* location that receives information */}
  ): CK_RV; cdecl;

{/* C_GetFunctionList returns the function list. */}
function C_GetFunctionList(
  ppFunctionList: CK_FUNCTION_LIST_PTR_PTR {/* receives pointer to
  * function list */}
  ): CK_RV; cdecl;

{/* Slot and token management */}

{/* C_GetSlotList obtains a list of slots in the system. */}
function C_GetSlotList(
  tokenPresent: CK_BBOOL;               {/* only slots with tokens? */}
  pSlotList: CK_SLOT_ID_PTR;            {/* receives array of slot IDs */}
  pulCount: CK_ULONG_PTR                {/* receives number of slots */}
  ): CK_RV; cdecl;

{/* C_GetSlotInfo obtains information about a particular slot in
  * the system. */}
function C_GetSlotInfo(
  slotID: CK_SLOT_ID;                   {/* the ID of the slot */}
  pInfo: CK_SLOT_INFO_PTR               {/* receives the slot information */}
  ): CK_RV; cdecl;

{/* C_GetTokenInfo obtains information about a particular token
  * in the system. */}
function C_GetTokenInfo(
  slotID: CK_SLOT_ID;                   {/* ID of the token's slot */}
  pInfo: CK_TOKEN_INFO_PTR              {/* receives the token information */}
  ): CK_RV; cdecl;

{/* C_GetMechanismList obtains a list of mechanism types
  * supported by a token. */}
function C_GetMechanismList(
  slotID: CK_SLOT_ID;                   {/* ID of token's slot */}
  pMechanismList: CK_MECHANISM_TYPE_PTR; {/* gets mech. array */}
  pulCount: CK_ULONG_PTR                {/* gets # of mechs. */}
  ): CK_RV; cdecl;

{/* C_GetMechanismInfo obtains information about a particular
  * mechanism possibly supported by a token. */}
function C_GetMechanismInfo(
  slotID: CK_SLOT_ID;                   {/* ID of the token's slot */}
  _type: CK_MECHANISM_TYPE;             {/* type of mechanism */}
  pInfo: CK_MECHANISM_INFO_PTR          {/* receives mechanism info */}
  ): CK_RV; cdecl;

{/* C_InitToken initializes a token. */}
function C_InitToken(
  slotID: CK_SLOT_ID;                   {/* ID of the token's slot */}
  pPin: CK_UTF8CHAR_PTR;                {/* the SO's initial PIN */}
  ulPinLen: CK_ULONG;                   {/* length in bytes of the PIN */}
  pLabel: CK_UTF8CHAR_PTR               {/* 32-byte token label (blank padded) */}
  ): CK_RV; cdecl;

{/* C_InitPIN initializes the normal user's PIN. */}
function C_InitPIN(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pPin: CK_UTF8CHAR_PTR;                {/* the normal user's PIN */}
  ulPinLen: CK_ULONG                    {/* length in bytes of the PIN */}
  ): CK_RV; cdecl;

{/* C_SetPIN modifies the PIN of the user who is logged in. */}
function C_SetPIN(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pOldPin: CK_UTF8CHAR_PTR;             {/* the old PIN */}
  ulOldLen: CK_ULONG;                   {/* length of the old PIN */}
  pNewPin: CK_UTF8CHAR_PTR;             {/* the new PIN */}
  ulNewLen: CK_ULONG                    {/* length of the new PIN */}
  ): CK_RV; cdecl;

{/* Session management */}

{/* C_OpenSession opens a session between an application and a
  * token. */}
function C_OpenSession(
  slotID: CK_SLOT_ID;                   {/* the slot's ID */}
  flags: CK_FLAGS;                      {/* from CK_SESSION_INFO */}
  pApplication: CK_VOID_PTR;            {/* passed to callback */}
  Notify: CK_NOTIFY;                    {/* callback function */}
  phSession: CK_SESSION_HANDLE_PTR      {/* gets session handle */}
  ): CK_RV; cdecl;

{/* C_CloseSession closes a session between an application and a
  * token. */}
function C_CloseSession(
  hSession: CK_SESSION_HANDLE           {/* the session's handle */}
  ): CK_RV; cdecl;

{/* C_CloseAllSessions closes all sessions with a token. */}
function C_CloseAllSessions(
  slotID: CK_SLOT_ID                    {/* the token's slot */}
  ): CK_RV; cdecl;

{/* C_GetSessionInfo obtains information about the session. */}
function C_GetSessionInfo(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pInfo: CK_SESSION_INFO_PTR            {/* receives session info */}
  ): CK_RV; cdecl;

{/* C_GetOperationState obtains the state of the cryptographic operation
  * in a session. */}
function C_GetOperationState(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pOperationState: CK_BYTE_PTR;         {/* gets state */}
  pulOperationStateLen: CK_ULONG_PTR    {/* gets state length */}
  ): CK_RV; cdecl;

{/* C_SetOperationState restores the state of the cryptographic
  * operation in a session. */}
function C_SetOperationState(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pOperationState: CK_BYTE_PTR;         {/* holds state */}
  ulOperationStateLen: CK_ULONG;        {/* holds state length */}
  hEncryptionKey: CK_OBJECT_HANDLE;     {/* en/decryption key */}
  hAuthenticationKey: CK_OBJECT_HANDLE  {/* sign/verify key */}
  ): CK_RV; cdecl;

{/* C_Login logs a user into a token. */}
function C_Login(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  userType: CK_USER_TYPE;               {/* the user type */}
  pPin: CK_UTF8CHAR_PTR;                {/* the user's PIN */}
  ulPinLen: CK_ULONG                    {/* the length of the PIN */}
  ): CK_RV; cdecl;

{/* C_Logout logs a user out from a token. */}
function C_Logout(
  hSession: CK_SESSION_HANDLE           {/* the session's handle */}
  ): CK_RV; cdecl;

{/* Object management */}

{/* C_CreateObject creates a new object. */}
function C_CreateObject(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* the object's template */}
  ulCount: CK_ULONG;                    {/* attributes in template */}
  phObject: CK_OBJECT_HANDLE_PTR        {/* gets new object's handle. */}
  ): CK_RV; cdecl;

{/* C_CopyObject copies an object; creating a new object for the
  * copy. */}
function C_CopyObject(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* template for new object */}
  ulCount: CK_ULONG;                    {/* attributes in template */}
  phNewObject: CK_OBJECT_HANDLE_PTR     {/* receives handle of copy */}
  ): CK_RV; cdecl;

{/* C_DestroyObject destroys an object. */}
function C_DestroyObject(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE             {/* the object's handle */}
  ): CK_RV; cdecl;

{/* C_GetObjectSize gets the size of an object in bytes. */}
function C_GetObjectSize(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pulSize: CK_ULONG_PTR                 {/* receives size of object */}
  ): CK_RV; cdecl;

{/* C_GetAttributeValue obtains the value of one or more object
  * attributes. */}
function C_GetAttributeValue(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* specifies attrs; gets vals */}
  ulCount: CK_ULONG                     {/* attributes in template */}
  ): CK_RV; cdecl;

{/* C_SetAttributeValue modifies the value of one or more object
  * attributes */}
function C_SetAttributeValue(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* specifies attrs and values */}
  ulCount: CK_ULONG                     {/* attributes in template */}
  ): CK_RV; cdecl;

{/* C_FindObjectsInit initializes a search for token and session
  * objects that match a template. */}
function C_FindObjectsInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* attribute values to match */}
  ulCount: CK_ULONG                     {/* attrs in search template */}
  ): CK_RV; cdecl;

{/* C_FindObjects continues a search for token and session
  * objects that match a template; obtaining additional object
  * handles. */}
function C_FindObjects(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  phObject: CK_OBJECT_HANDLE_PTR;       {/* gets obj. handles */}
  ulMaxObjectCount: CK_ULONG;           {/* max handles to get */}
  pulObjectCount: CK_ULONG_PTR          {/* actual # returned */}
  ): CK_RV; cdecl;

{/* C_FindObjectsFinal finishes a search for token and session
  * objects. */}
function C_FindObjectsFinal(
  hSession: CK_SESSION_HANDLE           {/* the session's handle */}
  ): CK_RV; cdecl;

{/* Encryption and decryption */}

{/* C_EncryptInit initializes an encryption operation. */}
function C_EncryptInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR;         {/* the encryption mechanism */}
  hKey: CK_OBJECT_HANDLE                {/* handle of encryption key */}
  ): CK_RV; cdecl;

{/* C_Encrypt encrypts single-part data. */}
function C_Encrypt(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pData: CK_BYTE_PTR;                   {/* the plaintext data */}
  ulDataLen: CK_ULONG;                  {/* bytes of plaintext */}
  pEncryptedData: CK_BYTE_PTR;          {/* gets ciphertext */}
  pulEncryptedDataLen: CK_ULONG_PTR     {/* gets c-text size */}
  ): CK_RV; cdecl;

{/* C_EncryptUpdate continues a multiple-part encryption
  * operation. */}
function C_EncryptUpdate(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pPart: CK_BYTE_PTR;                   {/* the plaintext data */}
  ulPartLen: CK_ULONG;                  {/* plaintext data len */}
  pEncryptedPart: CK_BYTE_PTR;          {/* gets ciphertext */}
  pulEncryptedPartLen: CK_ULONG_PTR     {/* gets c-text size */}
  ): CK_RV; cdecl;

{/* C_EncryptFinal finishes a multiple-part encryption
  * operation. */}
function C_EncryptFinal(
  hSession: CK_SESSION_HANDLE;          {/* session handle */}
  pLastEncryptedPart: CK_BYTE_PTR;      {/* last c-text */}
  pulLastEncryptedPartLen: CK_ULONG_PTR {/* gets last size */}
  ): CK_RV; cdecl;

{/* C_DecryptInit initializes a decryption operation. */}
function C_DecryptInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR;         {/* the decryption mechanism */}
  hKey: CK_OBJECT_HANDLE                {/* handle of decryption key */}
  ): CK_RV; cdecl;

{/* C_Decrypt decrypts encrypted data in a single part. */}
function C_Decrypt(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pEncryptedData: CK_BYTE_PTR;          {/* ciphertext */}
  ulEncryptedDataLen: CK_ULONG;         {/* ciphertext length */}
  pData: CK_BYTE_PTR;                   {/* gets plaintext */}
  pulDataLen: CK_ULONG_PTR              {/* gets p-text size */}
  ): CK_RV; cdecl;

{/* C_DecryptUpdate continues a multiple-part decryption
  * operation. */}
function C_DecryptUpdate(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pEncryptedPart: CK_BYTE_PTR;          {/* encrypted data */}
  ulEncryptedPartLen: CK_ULONG;         {/* input length */}
  pPart: CK_BYTE_PTR;                   {/* gets plaintext */}
  pulPartLen: CK_ULONG_PTR              {/* p-text size */}
  ): CK_RV; cdecl;

{/* C_DecryptFinal finishes a multiple-part decryption
  * operation. */}
function C_DecryptFinal(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pLastPart: CK_BYTE_PTR;               {/* gets plaintext */}
  pulLastPartLen: CK_ULONG_PTR          {/* p-text size */}
  ): CK_RV; cdecl;

{/* Message digesting */}

{/* C_DigestInit initializes a message-digesting operation. */}
function C_DigestInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR          {/* the digesting mechanism */}
  ): CK_RV; cdecl;

{/* C_Digest digests data in a single part. */}
function C_Digest(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* data to be digested */}
  ulDataLen: CK_ULONG ;                   {/* bytes of data to digest */}
  pDigest: CK_BYTE_PTR ;                  {/* gets the message digest */}
  pulDigestLen: CK_ULONG_PTR              {/* gets digest length */}
  ): CK_RV; cdecl;

{/* C_DigestUpdate continues a multiple-part message-digesting
  * operation. */}
function C_DigestUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* data to be digested */}
  ulPartLen: CK_ULONG                     {/* bytes of data to be digested */}
  ): CK_RV; cdecl;

{/* C_DigestKey continues a multi-part message-digesting
  * operation; by digesting the value of a secret key as part of
  * the data already digested. */}
function C_DigestKey(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  hKey: CK_OBJECT_HANDLE                  {/* secret key to digest */}
  ): CK_RV; cdecl;

{/* C_DigestFinal finishes a multiple-part message-digesting
  * operation. */}
function C_DigestFinal(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pDigest: CK_BYTE_PTR ;                  {/* gets the message digest */}
  pulDigestLen: CK_ULONG_PTR              {/* gets byte count of digest */}
  ): CK_RV; cdecl;

{/* Signing and MACing */}

{/* C_SignInit initializes a signature (private key encryption
  * operation; where the signature is (will be) an appendix to
  * the data; and plaintext cannot be recovered from the
 *signature. */}
function C_SignInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the signature mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* handle of signature key */}
  ): CK_RV; cdecl;

{/* C_Sign signs (encrypts with private key) data in a single
  * part; where the signature is (will be) an appendix to the
  * data; and plaintext cannot be recovered from the signature. */}
function C_Sign(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* the data to sign */}
  ulDataLen: CK_ULONG ;                   {/* count of bytes to sign */}
  pSignature: CK_BYTE_PTR ;               {/* gets the signature */}
  pulSignatureLen: CK_ULONG_PTR           {/* gets signature length */}
  ): CK_RV; cdecl;

{/* C_SignUpdate continues a multiple-part signature operation,
  * where the signature is (will be) an appendix to the data,
  * and plaintext cannot be recovered from the signature. */}
function C_SignUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* the data to sign */}
  ulPartLen: CK_ULONG                     {/* count of bytes to sign */}
  ): CK_RV; cdecl;

{/* C_SignFinal finishes a multiple-part signature operation,
  * returning the signature. */}
function C_SignFinal(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSignature: CK_BYTE_PTR ;               {/* gets the signature */}
  pulSignatureLen: CK_ULONG_PTR           {/* gets signature length */}
  ): CK_RV; cdecl;

{/* C_SignRecoverInit initializes a signature operation; where
  * the data can be recovered from the signature. */}
function C_SignRecoverInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the signature mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* handle of the signature key */}
  ): CK_RV; cdecl;

{/* C_SignRecover signs data in a single operation; where the
  * data can be recovered from the signature. */}
function C_SignRecover(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* the data to sign */}
  ulDataLen: CK_ULONG ;                   {/* count of bytes to sign */}
  pSignature: CK_BYTE_PTR ;               {/* gets the signature */}
  pulSignatureLen: CK_ULONG_PTR           {/* gets signature length */}
  ): CK_RV; cdecl;

{/* Verifying signatures and MACs */}

{/* C_VerifyInit initializes a verification operation; where the
  * signature is an appendix to the data; and plaintext cannot
  *  cannot be recovered from the signature (e.g. DSA). */}
function C_VerifyInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the verification mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* verification key */}
  ): CK_RV; cdecl;

{/* C_Verify verifies a signature in a single-part operation,
  * where the signature is an appendix to the data; and plaintext
  * cannot be recovered from the signature. */}
function C_Verify(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* signed data */}
  ulDataLen: CK_ULONG ;                   {/* length of signed data */}
  pSignature: CK_BYTE_PTR ;               {/* signature */}
  ulSignatureLen: CK_ULONG                {/* signature length*/}
  ): CK_RV; cdecl;

{/* C_VerifyUpdate continues a multiple-part verification
  * operation; where the signature is an appendix to the data,
  * and plaintext cannot be recovered from the signature. */}
function C_VerifyUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* signed data */}
  ulPartLen: CK_ULONG                     {/* length of signed data */}
  ): CK_RV; cdecl;

{/* C_VerifyFinal finishes a multiple-part verification
  * operation; checking the signature. */}
function C_VerifyFinal(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSignature: CK_BYTE_PTR ;               {/* signature to verify */}
  ulSignatureLen: CK_ULONG                {/* signature length */}
  ): CK_RV; cdecl;

{/* C_VerifyRecoverInit initializes a signature verification
  * operation; where the data is recovered from the signature. */}
function C_VerifyRecoverInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the verification mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* verification key */}
  ): CK_RV; cdecl;

{/* C_VerifyRecover verifies a signature in a single-part
  * operation; where the data is recovered from the signature. */}
function C_VerifyRecover(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSignature: CK_BYTE_PTR ;               {/* signature to verify */}
  ulSignatureLen: CK_ULONG ;              {/* signature length */}
  pData: CK_BYTE_PTR ;                    {/* gets signed data */}
  pulDataLen: CK_ULONG_PTR                {/* gets signed data len */}
  ): CK_RV; cdecl;

{/* Dual-function cryptographic operations */}

{/* C_DigestEncryptUpdate continues a multiple-part digesting
  * and encryption operation. */}
function C_DigestEncryptUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* the plaintext data */}
  ulPartLen: CK_ULONG ;                   {/* plaintext length */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* gets ciphertext */}
  pulEncryptedPartLen: CK_ULONG_PTR       {/* gets c-text length */}
  ): CK_RV; cdecl;

{/* C_DecryptDigestUpdate continues a multiple-part decryption and
  * digesting operation. */}
function C_DecryptDigestUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* ciphertext */}
  ulEncryptedPartLen: CK_ULONG ;          {/* ciphertext length */}
  pPart: CK_BYTE_PTR ;                    {/* gets plaintext */}
  pulPartLen: CK_ULONG_PTR                {/* gets plaintext len */}
  ): CK_RV; cdecl;

{/* C_SignEncryptUpdate continues a multiple-part signing and
  * encryption operation. */}
function C_SignEncryptUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* the plaintext data */}
  ulPartLen: CK_ULONG ;                   {/* plaintext length */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* gets ciphertext */}
  pulEncryptedPartLen: CK_ULONG_PTR       {/* gets c-text length */}
  ): CK_RV; cdecl;

{/* C_DecryptVerifyUpdate continues a multiple-part decryption and
  * verify operation. */}
function C_DecryptVerifyUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* ciphertext */}
  ulEncryptedPartLen: CK_ULONG ;          {/* ciphertext length */}
  pPart: CK_BYTE_PTR ;                    {/* gets plaintext */}
  pulPartLen: CK_ULONG_PTR                {/* gets p-text length */}
  ): CK_RV; cdecl;

{/* Key management */}

{/* C_GenerateKey generates a secret key; creating a new key
  * object. */}
function C_GenerateKey(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* key generation mech. */}
  pTemplate: CK_ATTRIBUTE_PTR ;           {/* template for new key */}
  ulCount: CK_ULONG ;                     {/* # of attrs in template */}
  phKey: CK_OBJECT_HANDLE_PTR             {/* gets handle of new key */}
  ): CK_RV; cdecl;

{/* C_GenerateKeyPair generates a public-key/private-key pair,
  * creating new key objects. */}
function C_GenerateKeyPair(
  hSession: CK_SESSION_HANDLE ;           {/* session handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* key-gen mech. */}
  pPublicKeyTemplate: CK_ATTRIBUTE_PTR ;  {/* template for pub. key */}
  ulPublicKeyAttributeCount: CK_ULONG ;   {/* # pub. attrs. */}
  pPrivateKeyTemplate: CK_ATTRIBUTE_PTR ; {/* template for priv. key */}
  ulPrivateKeyAttributeCount: CK_ULONG ;  {/* # priv. attrs. */}
  phPublicKey: CK_OBJECT_HANDLE_PTR ;     {/* gets pub. key handle */}
  phPrivateKey: CK_OBJECT_HANDLE_PTR      {/* gets priv. key handle */}
  ): CK_RV; cdecl;

{/* C_WrapKey wraps (i.e.; encrypts) a key. */}
function C_WrapKey(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the wrapping mechanism */}
  hWrappingKey: CK_OBJECT_HANDLE ;        {/* wrapping key */}
  hKey: CK_OBJECT_HANDLE ;                {/* key to be wrapped */}
  pWrappedKey: CK_BYTE_PTR ;              {/* gets wrapped key */}
  pulWrappedKeyLen: CK_ULONG_PTR          {/* gets wrapped key size */}
  ): CK_RV; cdecl;

{/* C_UnwrapKey unwraps (decrypts) a wrapped key; creating a new
  * key object. */}
function C_UnwrapKey(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* unwrapping mech. */}
  hUnwrappingKey: CK_OBJECT_HANDLE ;      {/* unwrapping key */}
  pWrappedKey: CK_BYTE_PTR ;              {/* the wrapped key */}
  ulWrappedKeyLen: CK_ULONG ;             {/* wrapped key len */}
  pTemplate: CK_ATTRIBUTE_PTR ;           {/* new key template */}
  ulAttributeCount: CK_ULONG ;            {/* template length */}
  phKey: CK_OBJECT_HANDLE_PTR             {/* gets new handle */}
  ): CK_RV; cdecl;

{/* C_DeriveKey derives a key from a base key; creating a new key
  * object. */}
function C_DeriveKey(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* key deriv. mech. */}
  hBaseKey: CK_OBJECT_HANDLE ;            {/* base key */}
  pTemplate: CK_ATTRIBUTE_PTR ;           {/* new key template */}
  ulAttributeCount: CK_ULONG ;            {/* template length */}
  phKey: CK_OBJECT_HANDLE_PTR             {/* gets new handle */}
  ): CK_RV; cdecl;

{/* Random number generation */}

{/* C_SeedRandom mixes additional seed material into the token's
  * random number generator. */}
function C_SeedRandom(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSeed: CK_BYTE_PTR ;                    {/* the seed material */}
  ulSeedLen: CK_ULONG                     {/* length of seed material */}
  ): CK_RV; cdecl;

{/* C_GenerateRandom generates random data. */}
function C_GenerateRandom(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  RandomData: CK_BYTE_PTR ;               {/* receives the random data */}
  ulRandomLen: CK_ULONG                   {/* # of bytes to generate */}
  ): CK_RV; cdecl;

{/* Parallel function management */}

{/* C_GetFunctionStatus is a legacy function; it obtains an
  * updated status of a function running in parallel with an
  * application. */}
function C_GetFunctionStatus(
  hSession: CK_SESSION_HANDLE             {/* the session's handle */}
  ): CK_RV; cdecl;

{/* C_CancelFunction is a legacy function; it cancels a function
  * running in parallel. */}
function C_CancelFunction(
  hSession: CK_SESSION_HANDLE             {/* the session's handle */}
  ): CK_RV; cdecl;

{/* Functions added in for Cryptoki Version 2.01 or later */}

{/* C_WaitForSlotEvent waits for a slot event (token insertion,
  * removal; etc.) to occur. */}
function C_WaitForSlotEvent(
  flags: CK_FLAGS ;                       {/* blocking/nonblocking flag */}
  pSlot: CK_SLOT_ID_PTR ;                 {/* location that receives the slot ID */}
  pRserved: CK_VOID_PTR                   {/* reserved.  Should be NULL_PTR */}
  ): CK_RV; cdecl;

implementation

const
  PKCS11DLL = 'libnki'; //'Belgium Identity Card PKCS11.dll';
  
{/* C_Initialize initializes the Cryptoki library. */}
function C_Initialize(
  pInitArgs: CK_VOID_PTR {/* if this is not NULL_PTR, it gets cast to CK_C_INITIALIZE_ARGS_PTR and dereferenced */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Finalize indicates that an application is done with the
  * Cryptoki library. */}
function C_Finalize(
  pReserved: CK_VOID_PTR                {/* reserved.  Should be NULL_PTR */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetInfo returns general information about Cryptoki. */}
function C_GetInfo(
  pInfo: CK_INFO_PTR                    {/* location that receives information */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetFunctionList returns the function list. */}
function C_GetFunctionList(
  ppFunctionList: CK_FUNCTION_LIST_PTR_PTR {/* receives pointer to
  * function list */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Slot and token management */}

{/* C_GetSlotList obtains a list of slots in the system. */}
function C_GetSlotList(
  tokenPresent: CK_BBOOL;               {/* only slots with tokens? */}
  pSlotList: CK_SLOT_ID_PTR;            {/* receives array of slot IDs */}
  pulCount: CK_ULONG_PTR                {/* receives number of slots */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetSlotInfo obtains information about a particular slot in
  * the system. */}
function C_GetSlotInfo(
  slotID: CK_SLOT_ID;                   {/* the ID of the slot */}
  pInfo: CK_SLOT_INFO_PTR               {/* receives the slot information */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetTokenInfo obtains information about a particular token
  * in the system. */}
function C_GetTokenInfo(
  slotID: CK_SLOT_ID;                   {/* ID of the token's slot */}
  pInfo: CK_TOKEN_INFO_PTR              {/* receives the token information */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetMechanismList obtains a list of mechanism types
  * supported by a token. */}
function C_GetMechanismList(
  slotID: CK_SLOT_ID;                   {/* ID of token's slot */}
  pMechanismList: CK_MECHANISM_TYPE_PTR; {/* gets mech. array */}
  pulCount: CK_ULONG_PTR                {/* gets # of mechs. */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetMechanismInfo obtains information about a particular
  * mechanism possibly supported by a token. */}
function C_GetMechanismInfo(
  slotID: CK_SLOT_ID;                   {/* ID of the token's slot */}
  _type: CK_MECHANISM_TYPE;             {/* type of mechanism */}
  pInfo: CK_MECHANISM_INFO_PTR          {/* receives mechanism info */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_InitToken initializes a token. */}
function C_InitToken(
  slotID: CK_SLOT_ID;                   {/* ID of the token's slot */}
  pPin: CK_UTF8CHAR_PTR;                {/* the SO's initial PIN */}
  ulPinLen: CK_ULONG;                   {/* length in bytes of the PIN */}
  pLabel: CK_UTF8CHAR_PTR               {/* 32-byte token label (blank padded) */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_InitPIN initializes the normal user's PIN. */}
function C_InitPIN(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pPin: CK_UTF8CHAR_PTR;                {/* the normal user's PIN */}
  ulPinLen: CK_ULONG                    {/* length in bytes of the PIN */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SetPIN modifies the PIN of the user who is logged in. */}
function C_SetPIN(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pOldPin: CK_UTF8CHAR_PTR;             {/* the old PIN */}
  ulOldLen: CK_ULONG;                   {/* length of the old PIN */}
  pNewPin: CK_UTF8CHAR_PTR;             {/* the new PIN */}
  ulNewLen: CK_ULONG                    {/* length of the new PIN */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Session management */}

{/* C_OpenSession opens a session between an application and a
  * token. */}
function C_OpenSession(
  slotID: CK_SLOT_ID;                   {/* the slot's ID */}
  flags: CK_FLAGS;                      {/* from CK_SESSION_INFO */}
  pApplication: CK_VOID_PTR;            {/* passed to callback */}
  Notify: CK_NOTIFY;                    {/* callback function */}
  phSession: CK_SESSION_HANDLE_PTR      {/* gets session handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_CloseSession closes a session between an application and a
  * token. */}
function C_CloseSession(
  hSession: CK_SESSION_HANDLE           {/* the session's handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_CloseAllSessions closes all sessions with a token. */}
function C_CloseAllSessions(
  slotID: CK_SLOT_ID                    {/* the token's slot */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetSessionInfo obtains information about the session. */}
function C_GetSessionInfo(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pInfo: CK_SESSION_INFO_PTR            {/* receives session info */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetOperationState obtains the state of the cryptographic operation
  * in a session. */}
function C_GetOperationState(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pOperationState: CK_BYTE_PTR;         {/* gets state */}
  pulOperationStateLen: CK_ULONG_PTR    {/* gets state length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SetOperationState restores the state of the cryptographic
  * operation in a session. */}
function C_SetOperationState(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pOperationState: CK_BYTE_PTR;         {/* holds state */}
  ulOperationStateLen: CK_ULONG;        {/* holds state length */}
  hEncryptionKey: CK_OBJECT_HANDLE;     {/* en/decryption key */}
  hAuthenticationKey: CK_OBJECT_HANDLE  {/* sign/verify key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Login logs a user into a token. */}
function C_Login(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  userType: CK_USER_TYPE;               {/* the user type */}
  pPin: CK_UTF8CHAR_PTR;                {/* the user's PIN */}
  ulPinLen: CK_ULONG                    {/* the length of the PIN */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Logout logs a user out from a token. */}
function C_Logout(
  hSession: CK_SESSION_HANDLE           {/* the session's handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Object management */}

{/* C_CreateObject creates a new object. */}
function C_CreateObject(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* the object's template */}
  ulCount: CK_ULONG;                    {/* attributes in template */}
  phObject: CK_OBJECT_HANDLE_PTR        {/* gets new object's handle. */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_CopyObject copies an object; creating a new object for the
  * copy. */}
function C_CopyObject(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* template for new object */}
  ulCount: CK_ULONG;                    {/* attributes in template */}
  phNewObject: CK_OBJECT_HANDLE_PTR     {/* receives handle of copy */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DestroyObject destroys an object. */}
function C_DestroyObject(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE             {/* the object's handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetObjectSize gets the size of an object in bytes. */}
function C_GetObjectSize(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pulSize: CK_ULONG_PTR                 {/* receives size of object */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GetAttributeValue obtains the value of one or more object
  * attributes. */}
function C_GetAttributeValue(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* specifies attrs; gets vals */}
  ulCount: CK_ULONG                     {/* attributes in template */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SetAttributeValue modifies the value of one or more object
  * attributes */}
function C_SetAttributeValue(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  hObject: CK_OBJECT_HANDLE;            {/* the object's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* specifies attrs and values */}
  ulCount: CK_ULONG                     {/* attributes in template */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_FindObjectsInit initializes a search for token and session
  * objects that match a template. */}
function C_FindObjectsInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pTemplate: CK_ATTRIBUTE_PTR;          {/* attribute values to match */}
  ulCount: CK_ULONG                     {/* attrs in search template */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_FindObjects continues a search for token and session
  * objects that match a template; obtaining additional object
  * handles. */}
function C_FindObjects(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  phObject: CK_OBJECT_HANDLE_PTR;       {/* gets obj. handles */}
  ulMaxObjectCount: CK_ULONG;           {/* max handles to get */}
  pulObjectCount: CK_ULONG_PTR          {/* actual # returned */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_FindObjectsFinal finishes a search for token and session
  * objects. */}
function C_FindObjectsFinal(
  hSession: CK_SESSION_HANDLE           {/* the session's handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Encryption and decryption */}

{/* C_EncryptInit initializes an encryption operation. */}
function C_EncryptInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR;         {/* the encryption mechanism */}
  hKey: CK_OBJECT_HANDLE                {/* handle of encryption key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Encrypt encrypts single-part data. */}
function C_Encrypt(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pData: CK_BYTE_PTR;                   {/* the plaintext data */}
  ulDataLen: CK_ULONG;                  {/* bytes of plaintext */}
  pEncryptedData: CK_BYTE_PTR;          {/* gets ciphertext */}
  pulEncryptedDataLen: CK_ULONG_PTR     {/* gets c-text size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_EncryptUpdate continues a multiple-part encryption
  * operation. */}
function C_EncryptUpdate(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pPart: CK_BYTE_PTR;                   {/* the plaintext data */}
  ulPartLen: CK_ULONG;                  {/* plaintext data len */}
  pEncryptedPart: CK_BYTE_PTR;          {/* gets ciphertext */}
  pulEncryptedPartLen: CK_ULONG_PTR     {/* gets c-text size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_EncryptFinal finishes a multiple-part encryption
  * operation. */}
function C_EncryptFinal(
  hSession: CK_SESSION_HANDLE;          {/* session handle */}
  pLastEncryptedPart: CK_BYTE_PTR;      {/* last c-text */}
  pulLastEncryptedPartLen: CK_ULONG_PTR {/* gets last size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DecryptInit initializes a decryption operation. */}
function C_DecryptInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR;         {/* the decryption mechanism */}
  hKey: CK_OBJECT_HANDLE                {/* handle of decryption key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Decrypt decrypts encrypted data in a single part. */}
function C_Decrypt(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pEncryptedData: CK_BYTE_PTR;          {/* ciphertext */}
  ulEncryptedDataLen: CK_ULONG;         {/* ciphertext length */}
  pData: CK_BYTE_PTR;                   {/* gets plaintext */}
  pulDataLen: CK_ULONG_PTR              {/* gets p-text size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DecryptUpdate continues a multiple-part decryption
  * operation. */}
function C_DecryptUpdate(
  hSession: CK_SESSION_HANDLE;          {/* session's handle */}
  pEncryptedPart: CK_BYTE_PTR;          {/* encrypted data */}
  ulEncryptedPartLen: CK_ULONG;         {/* input length */}
  pPart: CK_BYTE_PTR;                   {/* gets plaintext */}
  pulPartLen: CK_ULONG_PTR              {/* p-text size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DecryptFinal finishes a multiple-part decryption
  * operation. */}
function C_DecryptFinal(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pLastPart: CK_BYTE_PTR;               {/* gets plaintext */}
  pulLastPartLen: CK_ULONG_PTR          {/* p-text size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Message digesting */}

{/* C_DigestInit initializes a message-digesting operation. */}
function C_DigestInit(
  hSession: CK_SESSION_HANDLE;          {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR          {/* the digesting mechanism */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Digest digests data in a single part. */}
function C_Digest(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* data to be digested */}
  ulDataLen: CK_ULONG ;                   {/* bytes of data to digest */}
  pDigest: CK_BYTE_PTR ;                  {/* gets the message digest */}
  pulDigestLen: CK_ULONG_PTR              {/* gets digest length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DigestUpdate continues a multiple-part message-digesting
  * operation. */}
function C_DigestUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* data to be digested */}
  ulPartLen: CK_ULONG                     {/* bytes of data to be digested */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DigestKey continues a multi-part message-digesting
  * operation; by digesting the value of a secret key as part of
  * the data already digested. */}
function C_DigestKey(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  hKey: CK_OBJECT_HANDLE                  {/* secret key to digest */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DigestFinal finishes a multiple-part message-digesting
  * operation. */}
function C_DigestFinal(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pDigest: CK_BYTE_PTR ;                  {/* gets the message digest */}
  pulDigestLen: CK_ULONG_PTR              {/* gets byte count of digest */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Signing and MACing */}

{/* C_SignInit initializes a signature (private key encryption
  * operation; where the signature is (will be) an appendix to
  * the data; and plaintext cannot be recovered from the
 *signature. */}
function C_SignInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the signature mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* handle of signature key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Sign signs (encrypts with private key) data in a single
  * part; where the signature is (will be) an appendix to the
  * data; and plaintext cannot be recovered from the signature. */}
function C_Sign(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* the data to sign */}
  ulDataLen: CK_ULONG ;                   {/* count of bytes to sign */}
  pSignature: CK_BYTE_PTR ;               {/* gets the signature */}
  pulSignatureLen: CK_ULONG_PTR           {/* gets signature length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SignUpdate continues a multiple-part signature operation,
  * where the signature is (will be) an appendix to the data,
  * and plaintext cannot be recovered from the signature. */}
function C_SignUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* the data to sign */}
  ulPartLen: CK_ULONG                     {/* count of bytes to sign */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SignFinal finishes a multiple-part signature operation,
  * returning the signature. */}
function C_SignFinal(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSignature: CK_BYTE_PTR ;               {/* gets the signature */}
  pulSignatureLen: CK_ULONG_PTR           {/* gets signature length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SignRecoverInit initializes a signature operation; where
  * the data can be recovered from the signature. */}
function C_SignRecoverInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the signature mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* handle of the signature key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SignRecover signs data in a single operation; where the
  * data can be recovered from the signature. */}
function C_SignRecover(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* the data to sign */}
  ulDataLen: CK_ULONG ;                   {/* count of bytes to sign */}
  pSignature: CK_BYTE_PTR ;               {/* gets the signature */}
  pulSignatureLen: CK_ULONG_PTR           {/* gets signature length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Verifying signatures and MACs */}

{/* C_VerifyInit initializes a verification operation; where the
  * signature is an appendix to the data; and plaintext cannot
  *  cannot be recovered from the signature (e.g. DSA). */}
function C_VerifyInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the verification mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* verification key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_Verify verifies a signature in a single-part operation,
  * where the signature is an appendix to the data; and plaintext
  * cannot be recovered from the signature. */}
function C_Verify(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pData: CK_BYTE_PTR ;                    {/* signed data */}
  ulDataLen: CK_ULONG ;                   {/* length of signed data */}
  pSignature: CK_BYTE_PTR ;               {/* signature */}
  ulSignatureLen: CK_ULONG                {/* signature length*/}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_VerifyUpdate continues a multiple-part verification
  * operation; where the signature is an appendix to the data,
  * and plaintext cannot be recovered from the signature. */}
function C_VerifyUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* signed data */}
  ulPartLen: CK_ULONG                     {/* length of signed data */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_VerifyFinal finishes a multiple-part verification
  * operation; checking the signature. */}
function C_VerifyFinal(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSignature: CK_BYTE_PTR ;               {/* signature to verify */}
  ulSignatureLen: CK_ULONG                {/* signature length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_VerifyRecoverInit initializes a signature verification
  * operation; where the data is recovered from the signature. */}
function C_VerifyRecoverInit(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the verification mechanism */}
  hKey: CK_OBJECT_HANDLE                  {/* verification key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_VerifyRecover verifies a signature in a single-part
  * operation; where the data is recovered from the signature. */}
function C_VerifyRecover(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSignature: CK_BYTE_PTR ;               {/* signature to verify */}
  ulSignatureLen: CK_ULONG ;              {/* signature length */}
  pData: CK_BYTE_PTR ;                    {/* gets signed data */}
  pulDataLen: CK_ULONG_PTR                {/* gets signed data len */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Dual-function cryptographic operations */}

{/* C_DigestEncryptUpdate continues a multiple-part digesting
  * and encryption operation. */}
function C_DigestEncryptUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* the plaintext data */}
  ulPartLen: CK_ULONG ;                   {/* plaintext length */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* gets ciphertext */}
  pulEncryptedPartLen: CK_ULONG_PTR       {/* gets c-text length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DecryptDigestUpdate continues a multiple-part decryption and
  * digesting operation. */}
function C_DecryptDigestUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* ciphertext */}
  ulEncryptedPartLen: CK_ULONG ;          {/* ciphertext length */}
  pPart: CK_BYTE_PTR ;                    {/* gets plaintext */}
  pulPartLen: CK_ULONG_PTR                {/* gets plaintext len */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_SignEncryptUpdate continues a multiple-part signing and
  * encryption operation. */}
function C_SignEncryptUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pPart: CK_BYTE_PTR ;                    {/* the plaintext data */}
  ulPartLen: CK_ULONG ;                   {/* plaintext length */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* gets ciphertext */}
  pulEncryptedPartLen: CK_ULONG_PTR       {/* gets c-text length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DecryptVerifyUpdate continues a multiple-part decryption and
  * verify operation. */}
function C_DecryptVerifyUpdate(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pEncryptedPart: CK_BYTE_PTR ;           {/* ciphertext */}
  ulEncryptedPartLen: CK_ULONG ;          {/* ciphertext length */}
  pPart: CK_BYTE_PTR ;                    {/* gets plaintext */}
  pulPartLen: CK_ULONG_PTR                {/* gets p-text length */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Key management */}

{/* C_GenerateKey generates a secret key; creating a new key
  * object. */}
function C_GenerateKey(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* key generation mech. */}
  pTemplate: CK_ATTRIBUTE_PTR ;           {/* template for new key */}
  ulCount: CK_ULONG ;                     {/* # of attrs in template */}
  phKey: CK_OBJECT_HANDLE_PTR             {/* gets handle of new key */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GenerateKeyPair generates a public-key/private-key pair,
  * creating new key objects. */}
function C_GenerateKeyPair(
  hSession: CK_SESSION_HANDLE ;           {/* session handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* key-gen mech. */}
  pPublicKeyTemplate: CK_ATTRIBUTE_PTR ;  {/* template for pub. key */}
  ulPublicKeyAttributeCount: CK_ULONG ;   {/* # pub. attrs. */}
  pPrivateKeyTemplate: CK_ATTRIBUTE_PTR ; {/* template for priv. key */}
  ulPrivateKeyAttributeCount: CK_ULONG ;  {/* # priv. attrs. */}
  phPublicKey: CK_OBJECT_HANDLE_PTR ;     {/* gets pub. key handle */}
  phPrivateKey: CK_OBJECT_HANDLE_PTR      {/* gets priv. key handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_WrapKey wraps (i.e.; encrypts) a key. */}
function C_WrapKey(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* the wrapping mechanism */}
  hWrappingKey: CK_OBJECT_HANDLE ;        {/* wrapping key */}
  hKey: CK_OBJECT_HANDLE ;                {/* key to be wrapped */}
  pWrappedKey: CK_BYTE_PTR ;              {/* gets wrapped key */}
  pulWrappedKeyLen: CK_ULONG_PTR          {/* gets wrapped key size */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_UnwrapKey unwraps (decrypts) a wrapped key; creating a new
  * key object. */}
function C_UnwrapKey(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* unwrapping mech. */}
  hUnwrappingKey: CK_OBJECT_HANDLE ;      {/* unwrapping key */}
  pWrappedKey: CK_BYTE_PTR ;              {/* the wrapped key */}
  ulWrappedKeyLen: CK_ULONG ;             {/* wrapped key len */}
  pTemplate: CK_ATTRIBUTE_PTR ;           {/* new key template */}
  ulAttributeCount: CK_ULONG ;            {/* template length */}
  phKey: CK_OBJECT_HANDLE_PTR             {/* gets new handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_DeriveKey derives a key from a base key; creating a new key
  * object. */}
function C_DeriveKey(
  hSession: CK_SESSION_HANDLE ;           {/* session's handle */}
  pMechanism: CK_MECHANISM_PTR ;          {/* key deriv. mech. */}
  hBaseKey: CK_OBJECT_HANDLE ;            {/* base key */}
  pTemplate: CK_ATTRIBUTE_PTR ;           {/* new key template */}
  ulAttributeCount: CK_ULONG ;            {/* template length */}
  phKey: CK_OBJECT_HANDLE_PTR             {/* gets new handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Random number generation */}

{/* C_SeedRandom mixes additional seed material into the token's
  * random number generator. */}
function C_SeedRandom(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  pSeed: CK_BYTE_PTR ;                    {/* the seed material */}
  ulSeedLen: CK_ULONG                     {/* length of seed material */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_GenerateRandom generates random data. */}
function C_GenerateRandom(
  hSession: CK_SESSION_HANDLE ;           {/* the session's handle */}
  RandomData: CK_BYTE_PTR ;               {/* receives the random data */}
  ulRandomLen: CK_ULONG                   {/* # of bytes to generate */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Parallel function management */}

{/* C_GetFunctionStatus is a legacy function; it obtains an
  * updated status of a function running in parallel with an
  * application. */}
function C_GetFunctionStatus(
  hSession: CK_SESSION_HANDLE             {/* the session's handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* C_CancelFunction is a legacy function; it cancels a function
  * running in parallel. */}
function C_CancelFunction(
  hSession: CK_SESSION_HANDLE             {/* the session's handle */}
  ): CK_RV; cdecl; external PKCS11DLL;

{/* Functions added in for Cryptoki Version 2.01 or later */}

{/* C_WaitForSlotEvent waits for a slot event (token insertion,
  * removal; etc.) to occur. */}
function C_WaitForSlotEvent(
  flags: CK_FLAGS ;                       {/* blocking/nonblocking flag */}
  pSlot: CK_SLOT_ID_PTR ;                 {/* location that receives the slot ID */}
  pRserved: CK_VOID_PTR                   {/* reserved.  Should be NULL_PTR */}
  ): CK_RV; cdecl; external PKCS11DLL;

end.

