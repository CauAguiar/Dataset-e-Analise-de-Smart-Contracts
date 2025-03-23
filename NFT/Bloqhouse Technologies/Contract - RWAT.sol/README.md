# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `RWAT`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID              | Descrição                                                                 | Severidade         |
|-----------------|---------------------------------------------------------------------------|--------------------|
| F-2023-0606     | EIP Standard Violation - Signatures do not include chain-specific parameters | High severity      |
| F-2023-0607     | Data Consistency - _tokenCap not checked, potentially leading to allocation override | High severity      |
| F-2023-0608     | Double-Spending - No internal nonce check for signature verification in claimUnits() | High severity      |
| F-2023-0609     | Contradiction - Parameters _name and _symbol do not overwrite ERC721 parameters correctly | High severity      |
| F-2023-0610     | Floating Pragma - Use of floating pragma ^0.8.4 in contracts                | Low severity       |
| F-2023-0611     | Shadowing State Variable - Variables like _name, _symbol, and _paused are shadowed | Low severity       |
| F-2023-0612     | Unindexed Events - Event parameters not indexed, making it harder to search | Low severity       |

---

### Análise por LLM

#### GPT-4o

| ID           | Descrição                                                                 | Severidade Detectada | Correta? | Tipo (VP/FP/FN)           |
|--------------|---------------------------------------------------------------------------|-----------------------|----------|----------------------------|
| F-2023-0606  | EIP Standard Violation - Signatures do not include chain-specific parameters | -                     | ❌       | FN                         |
| F-2023-0607  | Data Consistency - _tokenCap not checked                                 | -                     | ❌       | FN                         |
| F-2023-0608  | Double-Spending - No internal nonce check                                | Informational         | ✅       | VP (severidade incorreta)  |
| F-2023-0609  | Contradiction - _name e _symbol não sobrescrevem corretamente             | Low                   | ✅       | VP (severidade incorreta)  |
| F-2023-0610  | Floating Pragma - Uso de ^0.8.4                                           | -                     | ❌       | FN                         |
| F-2023-0611  | Shadowing State Variable - _name, _symbol, _paused                        | -                   | ❌       | FN                         |
| F-2023-0612  | Unindexed Events                                                          | -                     | ❌       | FN                         |
| -            | Falta de verificação de inicialização múltipla                           | High                  | ❌       | FP                         |
| -            | Falta de controle sobre serverPubKey                                     | High                  | ❌       | FP                         |
| -            | Problema de acesso no método burnUnits                                   | High                  | ❌       | FP                         |
| -            | Privacidade de metadados (tokenURI)                                      | Medium                | ❌       | FP                         |
| -            | Poder excessivo do ADMIN                                                 | Medium                | ❌       | FP                         |
| -            | Possível DoS na função setWhitelisted                                    | Medium                | ❌       | FP                         |
| -            | Uso de private para serverPubKey                                         | Low                   | ❌       | FP                         |
| -            | Comentários desatualizados e redundantes                                 | Informational         | ❌       | FP                         |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 2 (VP)             | 8 (FP)                 |
| **Não Detectado** | 5 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| F-2023-0608                | Informational              | High                   | **3**    |  
| F-2023-0609                | Low                | High          | **2**    |  

#### DeepSeek-R1

| ID            | Descrição                                                                 | Severidade Detectada | Correta? | Tipo (VP/FP/FN)          |
|---------------|--------------------------------------------------------------------------|-----------------------|----------|---------------------------|
| F-2023-0606   | EIP Standard Violation - Signatures do not include chain-specific params | High severity         | ✅       | VP                        |
| F-2023-0607   | Data Consistency - _tokenCap not checked                                 | -                     | ❌       | FN                        |
| F-2023-0608   | Double-Spending - No internal nonce check in claimUnits()                | -                     | ❌       | FN                        |
| F-2023-0609   | Contradiction - _name and _symbol do not overwrite ERC721 correctly      | -                     | ❌       | FN                        |
| F-2023-0610   | Floating Pragma - Use of floating pragma ^0.8.4                          | -                     | ❌       | FN                        |
| F-2023-0611   | Shadowing State Variable - _name, _symbol, _paused are shadowed          | -                     | ❌       | FN                        |
| F-2023-0612 | Unindexed Events - Event parameters not indexed | - | ❌ | FN |
| -             | Centralized Control Over User Tokens                                     | High severity         | ❌       | FP                        |
| -             | Admin can update serverPubKey (signature forgery risk)                  | High severity         | ❌       | FP                        |
| -             | Missing Critical Event Emissions                                        | Medium severity       | ❌       | FP                        |
| -             | Unrestricted Asset Creation/Minting                                     | Medium severity       | ❌       | FP                        |
| -             | Admin Bypass of Transfer Restrictions                                   | Medium severity       | ❌       | FP                        |
| -             | Arbitrary Whitelist Manipulation                                        | Medium severity       | ❌       | FP                        |
| -             | Gas-Intensive Batch Operations                                          | Low severity          | ❌       | FP                        |
| -             | Lax Input Validation in Whitelist                                       | Low severity          | ❌       | FP                        |
| -             | Magic Numbers Without Constants                                         | Informational         | ❌       | FP                        |
| -             | Incomplete Function Documentation                                       | Informational         | ❌       | FP                        |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 10 (FP)                 |
| **Não Detectado** | 6 (FN)         | 0 (VN)                 |

#### Llama 3.3


| ID              | Descrição                                                                 | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|-----------------|---------------------------------------------------------------------------|---------------------|----------|-----------------|
| F-2023-0606     | EIP Standard Violation - Signatures do not include chain-specific parameters | -                   | ❌       | FN              |
| F-2023-0607     | Data Consistency - _tokenCap not checked, potentially leading to allocation override | -                   | ❌       | FN              |
| F-2023-0608     | Double-Spending - No internal nonce check for signature verification in claimUnits() | -                   | ❌       | FN              |
| F-2023-0609     | Contradiction - Parameters _name and _symbol do not overwrite ERC721 parameters correctly | -                   | ❌       | FN              |
| F-2023-0610     | Floating Pragma - Use of floating pragma ^0.8.4 in contracts                | -                   | ❌       | FN              |
| F-2023-0611     | Shadowing State Variable - Variables like _name, _symbol, and _paused are shadowed | -                   | ❌       | FN              |
| F-2023-0612     | Unindexed Events - Event parameters not indexed, making it harder to search | -                   | ❌       | FN              |
| -              | Reentrância | Low severity        | ❌       | FP              |
| -              | Unprotected Function (initialize) | High severity      | ❌       | FP              |
| -              | Use of tx.origin | High severity      | ❌       | FP              |
| -              | Unsecured Use of Signature | Medium severity      | ❌       | FP              |
| -              | Insecure Randomness | Medium severity      | ❌       | FP              |
| -              | Use of Outdated Library | Medium severity      | ❌       | FP              |
| -              | Missing Input Validation | Low severity        | ❌       | FP              |
| -              | Inconsistent Naming Conventions | Low severity        | ❌       | FP              |
| -              | Unused Variables | Low severity        | ❌       | FP              |
| -              | Complexidade do Contrato | Undetermined        | ❌       | FP              |
| -              | Interoperabilidade com Outros Contratos | Undetermined        | ❌       | FP              |
| -              | Ausência de Documentação | Informational        | ❌       | FP              |
| -              | Falta de Testes | Informational        | ❌       | FP              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 13 (FP)                 |
| **Não Detectado** | 7 (FN)         | 0 (VN)                 |

#### Gemini 2.0 Flash Thinking Experimental 01-21

| ID              | Descrição                                                                 | Severidade Detectada  | Correta? | Tipo (VP/FP/FN) |
|-----------------|---------------------------------------------------------------------------|---------------------|----------|-----------------|
| F-2023-0606     | EIP Standard Violation - Signatures do not include chain-specific parameters | -                   | ❌       | FN              |
| F-2023-0607     | Data Consistency - _tokenCap not checked, potentially leading to allocation override | -                   | ❌       | FN              |
| F-2023-0608     | Double-Spending - No internal nonce check for signature verification in claimUnits() | Low severity        | ✅       | VP (severidade incorreta) |
| F-2023-0609     | Contradiction - Parameters _name and _symbol do not overwrite ERC721 parameters correctly | -                   | ❌       | FN              |
| F-2023-0610     | Floating Pragma - Use of floating pragma ^0.8.4 in contracts                | -                   | ❌       | FN              |
| F-2023-0611     | Shadowing State Variable - Variables like _name, _symbol, and _paused are shadowed | -                   | ❌       | FN              |
| F-2023-0612     | Unindexed Events - Event parameters not indexed, making it harder to search | -                   | ❌       | FN              |
| -              | Falta de Validação do Contrato ICNR no Inicialize | Medium severity      | ❌       | FP              |
| -              | Risco de Negacao de Servico (DoS) em Funcoes de Whitelist | Medium severity      | ❌       | FP              |
| -              | Funcoes de Bloqueio Irreversivel sem Mecanismo de Desbloqueio | Medium severity      | ❌       | FP              |
| -              | Centralizacao Excessiva e Dependencia de Chave Privada Servidor para Mint e Claim | High severity       | ❌       | FP              |
| -              | Falta de Verificacao de Dono Antes do Burn em burnUnits | Low severity        | ❌       | FP              |
| -              | Potencial Confusao na Logica de Limites de Asset | Low severity        | ❌       | FP              |
| -              | Ausencia de Validacao de Entrada em setNameAndSymbol | Informational        | ❌       | FP              |
| -              | Uso Potencialmente Desnecessario de onlyRoles | Informational        | ❌       | FP              |
| -              | Visibilidade Interna para Funcoes Acessadas Externamente em ICNR | Informational        | ❌       | FP              |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 9 (FP)                 |
| **Não Detectado** | 6 (FN)         | 0 (VN)                 |

**Erro de Classificação**
| ID-Vulnerabilidade | Severidade (Experimental) | Severidade (Auditoria) | Diferença               |  
|--------------------|-----------------------|------------------------|-------------------------|  
| F-2023-0608                | Low              | High                   | **2**    |  



## Métricas Agregadas (RWAT.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 35.35 |
| **DeepSeek-R1** | 278.21 |
| **Llama 3.3** | 17.05 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 13.51 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 2 | 8 | 5 | 0 |
| **DeepSeek-R1** | 1 | 10 | 6 | 0 |
| **Llama 3.3** | 0 | 13 | 7 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 1 | 9 | 6 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 5 | 2 | 2.50 |
| **DeepSeek-R1** | 0 | 1 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 2 | 1 | 2.00 |

