/*
 * 'OpenSSL for Ruby' project
 * Copyright (C) 2001-2002  Michal Rokos <m.rokos@sh.cvut.cz>
 * All rights reserved.
 */
/*
 * This program is licensed under the same licence as Ruby.
 * (See the file 'COPYING'.)
 */
#if !defined(_OSSL_CIPHER_H_)
#define _OSSL_CIPHER_H_

const EVP_CIPHER *ossl_evp_get_cipherbyname(VALUE);
VALUE ossl_cipher_new(const EVP_CIPHER *);
void Init_ossl_cipher(void);

#endif /* _OSSL_CIPHER_H_ */
