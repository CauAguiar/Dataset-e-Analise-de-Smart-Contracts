# Smart Contract Audit Analysis with LLMs

---

## Auditoria: `ERC721Vault`

### Vulnerabilidades Conhecidas (Ground Truth)
| ID  | Description                                                                                                                                                                                                                                     | Severity           |
|-----|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| V01 | **Unable to recall bridged tokens**: The `onMessageRecalled()` function fails to correctly handle token recall when transitioning between chains due to incorrect mapping checks. The recommendation is to use the `canonicalToBridged` mapping. | High               |
| V02 | **Unsafe ERC721 operations**: Using `_mint()` and `transferFrom()` may lead to permanent NFT loss, as they don't check for ERC721 support. The recommendation is to use `safeMint()` and `safeTransferFrom()`.                                    | Low                |
| V03 | **Use `encodeCall` instead of `encodeWithSelector`**: The `_handleMessage()` function uses `abi.encodeWithSelector`, which lacks type checking. `encodeCall` should be used for type safety.                                                      | Low                |
---

### Análise por LLM

#### GPT-4o

| ID  | Descrição                                                    | Severidade Detectada | Correta? | Tipo (VP/FP/FN)             |
|-----|--------------------------------------------------------------|----------------------|----------|-----------------------------|
| V01 | Falha na verificação de tokens ao alternar cadeias          | High                | ✅       | VP                          |
| V02 | Uso inseguro de `_mint()` e `transferFrom()`                 | -               |❌          | FN                          |
| V03 | Uso de `encodeWithSelector` ao invés de `encodeCall`         | -                 | ❌         | FN                          |
| -   | Possível problema de reentrada em `receiveToken`             | High                | ❌       | FP                          |
| -   | Falta de validação rigorosa de `msg.value`                   | High                | ❌       | FP                          |
| -   | Uso de `unchecked` sem necessidade                           | High                | ❌       | FP                          |
| -   | Falta de validação de endereços em `_deployBridgedToken`     | Medium              | ❌       | FP                          |
| -   | Possível perda de fundos ao enviar mensagem para `IBridge`   | Medium              | ❌       | FP                          |
| -   | Uso de `resolve` sem controle de retornos                    | Medium              | ❌       | FP                          |
| -   | Eventos podem ser manipulados por usuários maliciosos        | Low                 | ❌       | FP                          |
| -   | Falta de controle sobre o nome do contrato (`name()`)        | Low                 | ❌       | FP                          |
| -   | Dependência em `IBridge` para segurança                      | Indeterminado       | ❌       | FP                          |
| -   | Possível ataque de replay entre chains                       | Indeterminado       | ❌       | FP                          |
| -   | Comentários de código incompletos ou desatualizados          | Informational       | ❌       | FP                          |
| -   | Uso de `// SPDX-License-Identifier: MIT` sem confirmação     | Informational       | ❌       | FP                          |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 12 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |

---

#### DeepSeek-R1
| ID  | Descrição                                                                                           | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)                 |
|-----|-----------------------------------------------------------------------------------------------------|----------------------|----------|--------------------------------|
| V01 | **Unable to recall bridged tokens**: The `onMessageRecalled()` function fails to correctly handle token recall when transitioning between chains due to incorrect mapping checks. The recommendation is to use the `canonicalToBridged` mapping. | -                | ❌          | FN    |
| V02 | **Unsafe ERC721 operations**: Using `_mint()` and `transferFrom()` may lead to permanent NFT loss, as they don't check for ERC721 support. The recommendation is to use `safeMint()` and `safeTransferFrom()`. | Low                  | ✅       | VP                            |
| V03 | **Use `encodeCall` instead of `encodeWithSelector`**: The `_handleMessage()` function uses `abi.encodeWithSelector`, which lacks type checking. `encodeCall` should be used for type safety. | -                  | ❌          | FN                           |
| -   | **Unbounded Token ID Arrays Causing Gas Limitations**: Looping through large `tokenIds` arrays (e.g., in `receiveToken`, `onMessageRecalled`) may exceed gas limits, leading to failed transactions. | Medium               | ❌       | FP                            |
| -   | **Implicit Reliance on ERC721Metadata Extension**: Tokens are assumed to implement the optional `name` and `symbol` functions (part of ERC721Metadata), which may cause failures for ERC721-compliant tokens without these functions. | Medium               | ❌       | FP                            |
| -   | **Unintended Token Locking via Direct Transfers**: ERC721 tokens sent directly to the vault (outside the `sendToken` flow) may become irretrievable. | Medium               | ❌       | FP                            |
| -   | **Use of `sendEther` That Silently Fails**: Ether transfers via `sendEther` (using low-level `send`) may fail without reverting, potentially leaving funds stuck in the contract. | Low                  | ❌       | FP                            |
| -   | **Unrestricted `onERC721Received` Callback**: The vault unconditionally accepts ERC721 tokens via `safeTransferFrom`, risking unintended lockups if users transfer tokens outside the protocol. | Informational        | ❌       | FP                            |
| -   | **Dependency on External Bridge Security**: The contract relies on the integrity of the bridge implementation; vulnerabilities in external components (e.g., message validation) could propagate to this contract. | Undetermined         | ❌       | FP                            |


**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 1 (VP)             | 6 (FP)                 |
| **Não Detectado** | 2 (FN)         | 0 (VN)                 |


---

### Llhama 3.3 
| ID  | Descrição                                                                                           | Severidade Detectada  | Correta? | Tipo (VP/FP/FN)                 |
|-----|-----------------------------------------------------------------------------------------------------|----------------------|----------|--------------------------------|
| V01 | **Unable to recall bridged tokens**: The `onMessageRecalled()` function fails to correctly handle token recall when transitioning between chains due to incorrect mapping checks. The recommendation is to use the `canonicalToBridged` mapping. | -                 | ❌          | FN                           |
| V02 | **Unsafe ERC721 operations**: Using `_mint()` and `transferFrom()` may lead to permanent NFT loss, as they don't check for ERC721 support. The recommendation is to use `safeMint()` and `safeTransferFrom()`. | -                  | ❌          | FN                           |
| V03 | **Use `encodeCall` instead of `encodeWithSelector`**: The `_handleMessage()` function uses `abi.encodeWithSelector`, which lacks type checking. `encodeCall` should be used for type safety. | -                  | ❌          | FN                        |
| -   | Execução de código não verificado              | High                 | ❌       | FP                            |
| -   | Uso de `tx.origin` em vez de `msg.sender`       | Medium               | ❌       | FP                            |
| -   | Falta de validação de entrada                  | Medium               | ❌       | FP                            |
| -   | Uso de `unchecked`                               | Medium               | ❌       | FP                            |
| -   | Injeção de eventos                            | Low                  | ❌       | FP                            |
| -   | Potencial para DoS                              | Low                  | ❌       | FP                            |
| -   | Dependência de bibliotecas externas             | Undetermined         | ❌       | FP                            |
| -   | Configuração e inicialização                  | Undetermined         | ❌       | FP                            |
| -   | Documentação e comentários                    | Informational        | ❌       | FP                            |
| -   | Testes e auditorias                            | Informational        | ❌       | FP                            |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 10 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

---

#### Gemini 2.0 Flash Thinking Experimental 01-21
| ID  | Descrição                                          | Severidade Detectada | Correta? | Tipo (VP/FP/FN)                 |
|-----|--------------------------------------------------|----------------------|----------|--------------------------------|
| V01 | Falha na manipulação de tokens bridged           | -             | -   ❌       | FN                             |
| V02 | Uso inseguro de `_mint()` e `transferFrom()`     | -                  | ❌         | FN                             |
| V03 | Uso de `encodeWithSelector` sem verificação de tipos | -                  | ❌         | FN                             |
| -   | Encaminhamento inesperado de Ether               | High                 | ❌       | FP                             |
| -   | Manipulação de taxas não clara                   | Medium               | ❌       | FP                             |
| -   | Potencial de DoS em loops                        | Medium               | ❌       | FP                             |
| -   | Dependência de AddressResolver e LibDeploy       | Informational        | ❌       | FP                             |

**Matriz de Confusão:**
|               | Vulnerável (Real) | Não Vulnerável (Real) |
|---------------|--------------------|------------------------|
| **Detectado** | 0 (VP)             | 4 (FP)                 |
| **Não Detectado** | 3 (FN)         | 0 (VN)                 |

---



## Métricas Agregadas (ERC721Vault.sol)

### Latência por LLM
| LLM | Latência (segundos) |
|-------------|------------------|
| **GPT-4o** | 9.97 |
| **DeepSeek-R1** | 91.51 |
| **Llama 3.3** | 12.59 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 14.72 |

### Matriz de Confusão Consolidada
| LLM | VP | FP | FN | VN |
|-----------|----|----|----|----|
| **GPT-4o** | 1 | 12 | 2 | 0 |
| **DeepSeek-R1** | 1 | 6 | 2 | 0 |
| **Llama 3.3** | 0 | 10 | 3 | 0 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 4 | 3 | 0 |

### Erro Médio de Classificação
| LLM | Soma das Diferenças | Total de Amostras | Erro Médio Absoluto |
|-----------|---------------------|---------------------|---------------------|
| **GPT-4o** | 0 | 1 | 0.00 |
| **DeepSeek-R1** | 0 | 1 | 0.00 |
| **Llama 3.3** | 0 | 0 | 0.00 |
| **Gemini 2.0 Flash Thinking Experimental 01-21** | 0 | 0 | 0.00 |

